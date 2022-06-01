import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login/models/contact_tracing_model.dart';
import 'package:login/models/user_model.dart';
import 'package:login/providers/nearby_connections.dart';
import 'package:login/screens/instruction_manual.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/widgets/home_screen_data.dart';
import 'package:login/widgets/navigation_drawer_widget.dart';
import 'package:uuid/uuid.dart';
import '../models/global_variables.dart' as globals;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            } else if (snapshot.hasData) {
              return globals.isFirstLogin == null ||
                      globals.isFirstLogin == true
                  ? InstructionManual()
                  : HomeScreenData();
            } else {
              globals.isLoggedIn = false;
              return LoginScreen();
            }
          })),
    );
  }
}
