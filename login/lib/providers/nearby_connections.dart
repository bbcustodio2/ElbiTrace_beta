import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login/models/contact_tracing_model.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

List<String> inProgressIds = [];
final Strategy strategy = Strategy.P2P_STAR;
Map<String, String> endpointMap = Map();
// User? user;
// User user = FirebaseAuth.instance.currentUser!;

void startNearbyDetection(User user) async {
  final deviceName = user.uid;

  bool locationPermission = await Nearby().checkLocationPermission();
  bool bluetooth = await Nearby().checkBluetoothPermission();
  bool checkLocation = await Nearby().checkLocationEnabled();
  try {
    if (!locationPermission) {
      await Nearby().askLocationPermission();
    }
    if (!bluetooth) {
      Nearby().askBluetoothPermission();
    }
    if (!locationPermission) {
      await Nearby().enableLocationServices();
    }
    if (locationPermission && bluetooth && checkLocation) {
      bool a = await Nearby().startAdvertising(
        deviceName,
        strategy,
        onConnectionInitiated: (String id, ConnectionInfo info) {
          print('id: ' + id.toString());
          print('connection Info: ' + info.endpointName);
        },
        onConnectionResult: (id, status) {
          print(status);
        },
        onDisconnected: (id) {
          print('Disconnected from device');
        },
      );
      print("ADVERTISING: " + a.toString());

      bool b = await Nearby().startDiscovery(
        deviceName,
        strategy,
        onEndpointFound: (id, name, serviceId) {
          print('id: ' + id.toString());
          print('name: ' + name.toString());
          print('serviceId: ' + serviceId.toString());
          endpointMap[id] = name;
          validateDevice(name, user);
        },
        onEndpointLost: (id) {
          endpointMap.remove(id);
          print('lost connection to device' + id!);
        },
      );
      print("DISCOVERING: " + b.toString());
    } else {
      startNearbyDetection(user);
    }
  } catch (exception) {
    print(exception);
  }
}

/// Called upon Connection request (on both devices)
/// Both need to accept connection to start sending/receiving
// void onConnectionInit(String id, ConnectionInfo info) async {
//   setState(() {
//     endpointMap[id] = info;
//     print(endpointMap.toString());
//   });
//   try {
//     await Nearby().acceptConnection(
//       id,
//       onPayLoadRecieved: (endid, payload) async {
//         print('Functionality not needed. Payload Received.');
//       },
//     );
//     print('devices: ' + endpointMap.toString());
//   } catch (e) {
//     print(e);
//   }
// }

void validateDevice(String deviceName, User user) async {
  if (!inProgressIds.contains(deviceName)) {
    inProgressIds.add(deviceName);
  } else {
    return;
  }
  Fluttertoast.showToast(
      msg: 'Device: ' + deviceName + ' Time: ' + DateTime.now().toString());
  print('Device: ' + deviceName + ' Time: ' + DateTime.now().toString());
  await Future.delayed(const Duration(seconds: 900));
  List idList = [];
  endpointMap.forEach((key, value) {
    if (!idList.contains(value)) {
      idList.add(value);
    }
  });
  print('done with: ' + deviceName);
  inProgressIds.remove(deviceName);
  if (idList.contains(deviceName)) {
    Fluttertoast.showToast(
        msg: 'internal timer: device.deviceName, Time: ' +
            DateTime.now().toString());
    print('internal timer: device.deviceName, Time: ' +
        DateTime.now().toString());
    if (deviceName != user.uid) {
      SendData(deviceName);
    }
    validateDevice(deviceName, user);
  }
}

void SendData(String senderId) async {
  DateTime now = DateTime.now();
  Timestamp time = Timestamp.fromDate(now);

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  GeoPoint location = GeoPoint(position.latitude, position.longitude);

  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  ContactTracingModel contactTracingModel = ContactTracingModel();

  contactTracingModel.location = location;
  contactTracingModel.timestamp = time;
  contactTracingModel.senderId = senderId;
  contactTracingModel.receiverId = user!.uid;
  contactTracingModel.checked = false;

  String randomUid = const Uuid().v1();
  if (senderId != 'Null' && user.uid != 'Null')
    await firebaseFirestore
        .collection("contact_tracing")
        .doc(randomUid)
        .set(contactTracingModel.toMap());
}
