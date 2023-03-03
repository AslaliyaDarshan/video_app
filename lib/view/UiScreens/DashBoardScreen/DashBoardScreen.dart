import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_player/video_player.dart';
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
  bool isLoading = false;
  late HomeProvider hpt;
  late HomeProvider hpf;

  @override
  void initState() {
    setState(() {
      Provider.of<HomeProvider>(context, listen: false).index = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    hpt = Provider.of<HomeProvider>(context, listen: true);
    hpf = Provider.of<HomeProvider>(context, listen: false);
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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 3, right: 3),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.white,
              color: Colors.pink.shade400,
              selectedIndex: hpt.index,
              onTabChange: (value) {
                hpf.changeIndex(value);
                // if (hpf.index == 1) {
                //   setState(() {
                //     playerController.setLooping(true);
                //     playerController.play();
                //     playerController.setVolume(1.0);
                //   });
                // } else if (hpf.index == 0) {
                //   setState(() {
                //     hpf.playPause();
                //     playerController.pause();
                //     playerController.setVolume(0.0);
                //   });
                // } else if (hpf.index == 2) {
                //   setState(() {
                //     hpf.playPause();
                //     playerController.pause();
                //     playerController.setVolume(0.0);
                //   });
                // } else if (hpf.index == 3) {
                //   setState(() {
                //     hpf.playPause();
                //     playerController.pause();
                //     playerController.setVolume(0.0);
                //   });
                // }
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
      body: IndexedStack(
        index: hpt.index,
        children: const [
          HomeScreen(),
          LiveScreen(),
          TabBarScreen(),
          ProfileScreen(),
        ],
      ),
      extendBody: true,
    );
  }
}
