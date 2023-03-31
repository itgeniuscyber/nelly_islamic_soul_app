import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_soul_app/constants/Constants.dart';
import 'package:muslim_soul_app/screens/qari_screen.dart';
import 'package:muslim_soul_app/screens/home_screen.dart';
import 'package:muslim_soul_app/screens/prayer_screen.dart';
import 'package:muslim_soul_app/screens/quran_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectindex = 0;
  List<Widget> _widgetsList = [
    HomeScreen(),
    QuranScreen(),
    QariListScreen(),
    PrayerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetsList[selectindex],
        bottomNavigationBar: ConvexAppBar(
          //list of tab items
          items: [
            TabItem(
                icon: Image.asset(
                  'assets/home.png',
                  color: Colors.white,
                ),
                title: 'Home'),
            TabItem(
                icon: Image.asset(
                  'assets/holyQuran.png',
                  color: Colors.white,
                ),
                title: 'Quran'),
            TabItem(
                icon: Image.asset(
                  'assets/audio.png',
                  color: Colors.white,
                ),
                title: 'Audio'),
            TabItem(
                icon: Image.asset(
                  'assets/prayer_icon.png',
                  color: Colors.white,
                ),
                title: 'Prayer'),
          ],
          initialActiveIndex: 0,
          onTap: updateIndex,
          backgroundColor: Constants.kPrimary,
          activeColor: Constants.kPrimary,
        ),
      ),
    );
  }

  void updateIndex(index) {
    setState(() {
      selectindex = index;
    });
  }
}
