import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/DashBoardScreen.dart';
import 'package:video_calling_app/view/UiScreens/GenderSelectScreen.dart';
import 'package:video_calling_app/view/UiScreens/IntroScreen.dart';
import 'package:video_calling_app/view/UiScreens/NicknameAddScreen.dart';
import 'package:video_calling_app/view/UiScreens/SelectYourGoalScreen.dart';
import 'package:video_calling_app/view/UiScreens/SpleshScreen.dart';
import 'package:video_calling_app/view/UiScreens/TermsScreen.dart';
import 'package:video_calling_app/view/UiScreens/UploadImageScreen.dart';
import 'package:video_calling_app/view/UiScreens/UserBirthdayScreen.dart';
import 'view/UiScreens/DashBoardScreen/Home/HomeScreen.dart';
import 'view/UiScreens/DashBoardScreen/Home/VideoCallScreen.dart';
import 'view/UiScreens/DashBoardScreen/Live/LiveScreen.dart';
import 'view/UiScreens/DashBoardScreen/Profile/ProfileScreen.dart';
import 'view/UiScreens/DashBoardScreen/Region/CountryScreen.dart';
import 'view/UiScreens/DashBoardScreen/Region/LanguageScreen.dart';
import 'view/UiScreens/DashBoardScreen/Region/TabBarScreen/TabBarScreen.dart';
import 'view/UiScreens/SelectGenderForVideoScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize(); //Add this
  await FaceCamera.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => const SplashScreen(),
            "/TermsScreen": (context) => const TermsScreen(),
            "/IntroScreen": (context) => const IntroScreen(),
            "/GenderSelect": (context) => const GenderSelectScreen(),
            "/UserBirthday": (context) => const UserBirthdayScreen(),
            "/NickName": (context) => const NickNameAddScreen(),
            "/UploadImage": (context) => const UploadImageScreen(),
            "/SelectYourGoal": (context) => const SelectYourGoalScreen(),
            "/DashBoard": (context) => const DashBoardScreen(),
            "/SelectGenderForVideo": (context) =>
                const SelectGenderForVideoScreen(),
            "/HomeScreen": (context) => const HomeScreen(),
            "/VideoCallScreen": (context) => const VideoCallScreen(),
            "/LiveScreen": (context) => const LiveScreen(),
            "/TabBarScreen": (context) => const TabBarScreen(),
            "/CountryScreen": (context) => const CountryScreen(),
            "/LanguageScreen": (context) => const LanguageScreen(),
            "/ProfileScreen": (context) => const ProfileScreen(),
          },
        ),
      ),
    ),
  );
}
