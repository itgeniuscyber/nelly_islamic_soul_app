import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_soul_app/screens/main_screen.dart';
import 'package:muslim_soul_app/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool alreadyUsed = false;

  void getData() async {
    // Obtain shared preferences. see wether user already viewed the splash screen
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
  }

  @override
  void initState() {
    super.initState();
    getData();
    // Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.pushReplacement(context,
    //             MaterialPageRoute(builder: (context) {
    //           return alreadyUsed ? MainScreen() : OnBoardingScreen();
    //           // return alreadyUsed ? MainScreen() : OnBoardingScreen();
    //         })));

    Timer(Duration(seconds: 3), () {
      // Get.offNamed("/login");
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => OnBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //muslim text
            const Center(
              child: Text(
                'Islamic Soul',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset('assets/islamic.png'),
            )
          ],
        ),
      ),
    );
  }
}
