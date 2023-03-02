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
  bool isLoading = false;

  @override
  void initState() {
    playerController.setVolume(0.0);
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
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 3, right: 3),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                /* topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)*/
              ),
              child: GNav(
                textStyle: TextStyle(color: Colors.pink.shade400),
                backgroundColor: Colors.pink.shade50,
                rippleColor: Colors.black,
                hoverColor: Colors.pink.shade400,
                gap: 8,
                tabBorderRadius: 50,
                tabActiveBorder:
                    Border.all(width: 2, color: Colors.pink.shade400),
                activeColor: Colors.white,
                iconSize: 30,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.white,
                color: Colors.pink.shade400,
                selectedIndex: controller.index.value,
                onTabChange: (value) {
                  controller.changeIndex(value);
                  if (controller.index.value == 1) {
                    setState(() {
                      playerController.setLooping(true);
                      playerController.play();
                      playerController.setVolume(1.0);
                    });
                  } else {
                    setState(() {
                      controller.playPause();
                      playerController.pause();
                      playerController.setVolume(0.0);
                    });
                  }
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
          ),
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.index.value,
          children: const [
            HomeScreen(),
            LiveScreen(),
            TabBarScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      extendBody: true,
    );
  }
}
