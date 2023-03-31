import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_soul_app/constants/Constants.dart';
import 'package:muslim_soul_app/constants/color_consts.dart';
import 'package:muslim_soul_app/screens/register_screen.dart';
import 'package:muslim_soul_app/screens/splash_screen.dart';

import 'firebase_options.dart';
import 'screens/juz_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/surah_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muslim Soul',
      theme: ThemeData(
          primarySwatch: NellyColor_consts.NellySwatch,
          primaryColor: Constants.kPrimary,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins'),
      home: SplashScreen(),
      routes: {
        JuzScreen.id: (context) => JuzScreen(),
        Surahdetail.id: (context) => Surahdetail(),
      },
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/main', page: () => MainScreen()),
      ],
    );
  }
}
