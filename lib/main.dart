

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:parent_app/screens/account/onboarding_screen.dart';
import 'package:parent_app/screens/account/onboarding_screen2.dart';
import 'package:parent_app/screens/bottom_nav_page/home_screen.dart';
import 'package:parent_app/screens/dashboard/dashboard_screen.dart';
import 'package:parent_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Parent App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
