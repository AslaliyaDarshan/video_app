/*import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../../Provider/HomeProvider.dart';
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
  List WidgetsList = const [
    HomeScreen(),
    LiveScreen(),
    TabBarScreen(),
    ProfileScreen(),
  ];
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
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
 topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)

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
                selectedIndex:
                    Provider.of<HomeProvider>(context, listen: true).index,
                onTabChange: (value) {
                  Provider.of<HomeProvider>(context, listen: false)
                      .changeIndex(value);
                  if (hpf.index == 1) {
                    setState(() {
                      playerController.setLooping(true);
                      playerController.play();
                      playerController.setVolume(1.0);
                    });
                  } else if (hpf.index == 0) {
                    setState(() {
                      hpf.playPause();
                      playerController.pause();
                      playerController.setVolume(0.0);
                    });
                  } else if (hpf.index == 2) {
                    setState(() {
                      hpf.playPause();
                      playerController.pause();
                      playerController.setVolume(0.0);
                    });
                  } else if (hpt.index == 3) {
                    setState(() {
                      hpf.playPause();
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
        extendBody: true,
        body:
WidgetsList[Provider.of<HomeProvider>(context, listen: true)
            .index],

            IndexedStack(
          index: hpt.index,
          children: const [
            HomeScreen(),
            LiveScreen(),
            TabBarScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }

// Future<bool> dialog() async {
//   Provider.of<HomeProvider>(context, listen: false).playPause();
//   playerController.pause();
//   return await false;
// }
}*/
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/Home/HomeScreen.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/Live/LiveScreen.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/Profile/ProfileScreen.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/Region/TabBarScreen/TabBarScreen.dart';
import 'package:video_player/video_player.dart';

import 'Home/VideoCallScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List WidgetsList = [
    HomeScreen(),
    LiveScreen(),
    TabBarScreen(),
    ProfileScreen(),
  ];
  late HomeProvider home_providert;
  late HomeProvider home_providerf;

  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).list;
    videoController = VideoPlayerController.asset(
        "${Provider.of<HomeProvider>(context, listen: false).model?.video}")
      ..initialize().then((value) {
        setState(() {
          // videoController.setLooping(true);
          // videoController.play();
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    home_providert = Provider.of<HomeProvider>(context, listen: true);
    home_providerf = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: WidgetsList[Provider.of<HomeProvider>(context, listen: true).index],
      extendBody: true,
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _createBottomNavigationBar() {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF5531A).withOpacity(0.9),
              Color(0xFFFF576F).withOpacity(0.9),
              Color(0xFFFF576F).withOpacity(0.9),
              Color(0xFFF5531A).withOpacity(0.9),
            ],
          ),
        ),
        child: BottomBarBubble(
          color: Colors.white,
          backgroundColor: Colors.transparent,
          height: 70,
          bubbleSize: 20,
          items: [
            BottomBarItem(
              iconData: Icons.home,
              label: 'Home',
            ),
            BottomBarItem(
              iconData: Icons.live_tv,
              label: 'Live',
            ),
            BottomBarItem(
              iconData: Icons.flag,
              label: 'Region',
            ),
            BottomBarItem(
              iconData: Icons.person,
              label: 'Profile',
            ),
          ],
          selectedIndex: Provider.of<HomeProvider>(context, listen: true).index,
          onSelect: (value) {
            Provider.of<HomeProvider>(context, listen: false)
                .changeIndex(value);
            try {
              if (home_providert.index == 1) {
                setState(() {
                  playerController.setLooping(true);
                  playerController.play();
                  playerController.setVolume(0.0);
                });
              } else {
                setState(
                  () {
                    home_providerf.playPause();
                    playerController.pause();
                    playerController.setVolume(0.0);
                  },
                );
              }
            } on Exception {}
          },
        ),
      ),
    );
  }
}
