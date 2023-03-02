import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/Region/CountryScreen.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/Region/LanguageScreen.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CountryScreen();
      LanguageScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: GlobalWidget.backgroundColor(
            SafeArea(
              child: Column(
                children: [
                  height(2.h),
                  TabBar(
                    indicatorWeight: 3,
                    indicatorPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: -8),
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white60,
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                    tabs: [
                      GlobalWidget.poppinsText("Country", Colors.white, 13.sp),
                      GlobalWidget.poppinsText("Language", Colors.white, 13.sp),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            CountryScreen(),
            LanguageScreen(),
          ],
        ),
      ),
    );
  }
}
