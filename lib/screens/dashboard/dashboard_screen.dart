import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:parent_app/screens/bottom_nav_page/live_cctv_screen.dart';
import '../../res/Colors/color.dart';
import '../bottom_nav_page/home_screen.dart';
import '../bottom_nav_page/profile_screen.dart';
import '../bottom_nav_page/payment_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    LiveCctvScreen(),
    PaymentScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 8.0,
          backgroundColor: AppColor.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.black,
          unselectedItemColor: AppColor.grey_text,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.house,),

              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.video),
              label: 'Live CCTV',
            ),
            BottomNavigationBarItem(

              icon: Icon(LucideIcons.banknote),
              label: 'Payments',
            ),

            BottomNavigationBarItem(
              icon: Icon(LucideIcons.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
      onWillPop: ()async{
        return exit(0) ;
      },
    );
  }
}
