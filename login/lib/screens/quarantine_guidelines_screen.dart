import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login/models/contact_tracing_model.dart';
import 'package:login/models/user_model.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/widgets/appbar_widget.dart';
import 'package:login/widgets/home_screen_data.dart';
import 'package:login/widgets/navigation_drawer_widget.dart';
import 'package:login/widgets/profile_widget.dart';
import 'package:login/widgets/quarantine_guidelines_widget.dart';
import 'package:uuid/uuid.dart';

class GuidelinesScreen extends StatefulWidget {
  GuidelinesScreen({Key? key}) : super(key: key);

  @override
  State<GuidelinesScreen> createState() => _GuidelinesScreenState();
}

class _GuidelinesScreenState extends State<GuidelinesScreen> {
  @override
  Widget build(BuildContext context) {
    final pageName = ModalRoute.of(context)?.settings.name;
    final _mediaQueryData = MediaQuery.of(context);
    final screenWidth = _mediaQueryData.size.width;
    final screenHeight = _mediaQueryData.size.height;

    return Scaffold(
        drawer: NavigationDrawerWidget(pageName: pageName ?? ''),
        appBar: buildAppBar(context, 'Profile Page'),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.cover,
                  height: screenWidth / 2,
                  width: screenWidth / 2,
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Quarantine Guidelines',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                )),
            SizedBox(height: screenHeight / 200),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "What to do when you're exposed to COVID",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
            SizedBox(height: screenHeight / 12),
            Container(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
                  child: QuarantineGuidelinesData()),
            )
          ],
        ));
  }

  Text toBold(String data) {
    return Text(
      data,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
