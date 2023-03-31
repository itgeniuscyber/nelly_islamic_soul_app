import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: // lotie animation
                  Lottie.asset('lottie/pray1.json'),
            ),
            Center(child: Text('Updating Prayer screen Soon...!!!')),
          ],
        ),
      ),
    );
  }
}
