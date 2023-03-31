import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:muslim_soul_app/constants/Constants.dart';
import 'package:muslim_soul_app/screens/main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: IntroductionScreen(
            //the pages below
            pages: [
              //first Page view Read Quran
              PageViewModel(
                title: "Read Quran",
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Customize your reading view, read in Multiple Language, Listen Different Audio",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                image: Center(
                    child: Image.asset(
                  'assets/quran.png',
                  fit: BoxFit.fitWidth,
                )),
              ),
              //Second Page view Prayer Alerts
              PageViewModel(
                title: "Prayer Alerts",
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Choose your Adhan, which prayer to be notified of and how often.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                image: Center(
                    child: Image.asset(
                  'assets/prayer.png',
                  fit: BoxFit.fitWidth,
                )),
              ),
              // third Page view Build Habits
              PageViewModel(
                title: "Build Better Habits",
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Make Islamic practices a part of your daily life in any way that best suits your life.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                image: Center(
                    child: Image.asset(
                  'assets/zakat.png',
                  fit: BoxFit.fitWidth,
                )),
              ),
            ],
            showNextButton: true,
            next: const Icon(Icons.arrow_forward, color: Constants.kPrimary),
            done: const Text("Done",
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Constants.kPrimary)),
            onDone: () {
              // On Done button pressed
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            // onSkip: () {
            //   // On Skip button pressed
            // },
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Constants.kPrimary,
              color: Colors.grey,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          )),
    );
  }
}
