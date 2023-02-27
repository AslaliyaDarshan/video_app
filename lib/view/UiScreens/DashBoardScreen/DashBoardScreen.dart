import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/view/UiScreens/Home/HomeScreen.dart';
import 'package:video_calling_app/view/UiScreens/Live/LiveScreen.dart';
import 'package:video_calling_app/view/UiScreens/Profile/ProfileScreen.dart';
import 'package:video_calling_app/view/UiScreens/Region/CountryScreen.dart';
import 'package:video_calling_app/view/UiScreens/Region/TabBarScreen/TabBarScreen.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.pink.shade100,
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: GNav(
          textStyle: TextStyle(color: Colors.pink.shade400),
          backgroundColor: Colors.pink.shade50,
          rippleColor: Colors.black,
          hoverColor: Colors.pink.shade400,
          gap: 8,
          tabActiveBorder: Border.all(width: 3, color: Colors.pink.shade400),
          activeColor: Colors.white,
          iconSize: 30,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.white,
          color: Colors.pink.shade400,
          selectedIndex: controller.index.value,
          onTabChange: (value) {
            setState(() {
              controller.changeIndex(value);
            });
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