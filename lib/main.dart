import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
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
  MobileAds.instance.initialize();
  await FaceCamera.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      MultiProvider(
        providers: [
          ListenableProvider<HomeProvider>(
            create: (context) => HomeProvider(),
          ),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              "/": (BuildContext context) => const SplashScreen(),
              "/TermsScreen": (BuildContext context) => const TermsScreen(),
              "/IntroScreen": (BuildContext context) => const IntroScreen(),
              "/GenderSelect": (BuildContext context) =>
                  const GenderSelectScreen(),
              "/UserBirthday": (BuildContext context) =>
                  const UserBirthdayScreen(),
              "/NickName": (BuildContext context) => const NickNameAddScreen(),
              "/UploadImage": (BuildContext context) =>
                  const UploadImageScreen(),
              "/SelectYourGoal": (BuildContext context) =>
                  const SelectYourGoalScreen(),
              "/SelectGenderForVideo": (BuildContext context) =>
                  const SelectGenderForVideoScreen(),
              "/DashBoard": (BuildContext context) => const DashBoardScreen(),
              "/HomeScreen": (BuildContext context) => const HomeScreen(),
              "/VideoCallScreen": (BuildContext context) =>
                  const VideoCallScreen(),
              "/LiveScreen": (BuildContext context) => const LiveScreen(),
              "/TabBarScreen": (BuildContext context) => const TabBarScreen(),
              "/CountryScreen": (BuildContext context) => const CountryScreen(),
              "/LanguageScreen": (BuildContext context) =>
                  const LanguageScreen(),
              "/ProfileScreen": (BuildContext context) => const ProfileScreen(),
            },
          ),
        ),
      ),
    ),
  );
}
