import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'Home/HomeScreen.dart';
import 'Live/LiveScreen.dart';
import 'Profile/ProfileScreen.dart';
import 'Region/TabBarScreen/TabBarScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  HomeController controller = Get.put(HomeController());
  List mLstSelectedScreen = const [
    HomeScreen(),
    LiveScreen(),
    TabBarScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    HomeScreen();
    LiveScreen();
    TabBarScreen();
    ProfileScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.pink.shade200,
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: GNav(
          textStyle: TextStyle(color: Colors.pink.shade400),
          backgroundColor: Colors.pink.shade50,
          rippleColor: Colors.black,
          hoverColor: Colors.pink.shade400,
          gap: 7,
          tabBorderRadius: 25,
          tabActiveBorder: Border.all(width: 2, color: Colors.pink.shade400),
          activeColor: Colors.white,
          iconSize: 30,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.white,
          color: Colors.pink.shade400,
          selectedIndex: controller.index.value,
          onTabChange: (value) {
            controller.changeIndex(value);
            HomeController.homeController.pBlnIsLoading.value = true;
            Timer(
              const Duration(seconds: 7),
              () {
                HomeController.homeController.pBlnIsLoading.value = false;
              },
            );
            setState(() {});
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
              iconActiveColor: Colors.pink.shade400,
            ),
            GButton(
              icon: Icons.live_tv_outlined,
              text: "Live",
              iconActiveColor: Colors.pink.shade400,
            ),
            GButton(
              icon: Icons.flag_rounded,
              text: "Country",
              iconActiveColor: Colors.pink.shade400,
            ),
            GButton(
              icon: Icons.person,
              text: "Profile",
              iconActiveColor: Colors.pink.shade400,
            ),
          ],
        ),
      ),
      body: mLstSelectedScreen[controller.index.value],
      extendBody: true,
    );
  }
}
