import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:http/http.dart' as http;
import 'package:video_calling_app/model/ApiModel.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_calling_app/view/ApiHelper/ApiHelperClass.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalWidget.backgroundColor(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset("assets/lottie/splash.json",
                  height: 22.h, width: 22.h, fit: BoxFit.fill),
            ),
            Text(
              "Video Calling App",
              style: GoogleFonts.lobster(
                  fontSize: 29.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  getConnectivity() {
    controller.subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        controller.isDeviceConnected.value =
            await InternetConnectionChecker().hasConnection;
        print("internet---------->${controller.isDeviceConnected.value}");
        if (controller.isDeviceConnected.value == false &&
            controller.isAlertSet.value == false) {
          if (mounted) {
            setState(() => {
                  showDialogBox(),
                  controller.isAlertSet.value = true,
                });
          }
        } else {
          getAd();
          isLogin();
        }
      },
    );
  }

  void showDialogBox() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("No Connection"),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');

                controller.isAlertSet.value = false;

                controller.isDeviceConnected.value =
                    await InternetConnectionChecker().hasConnection;
                if (!controller.isDeviceConnected.value) {
                  showDialogBox();
                  controller.isAlertSet.value = true;
                } else {
                  ApiHelper().AdData();
                  isLogin();
                }
              },
              child: const Text("ok"),
            ),
          ],
        );
      },
    );
  }

  void isLogin() async {
    if (controller.isDeviceConnected.value == false) {
      showDialogBox();
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () => Get.offAllNamed("/SelectGenderForVideo"),
        // () => Get.offAllNamed("/TermsScreen"),
      );
      // }
    }
  }

  getAd() async {
    Map<String, String> requestHeaders = {
      'Host': '<calculated when request is sent>',
      'User-Agent': 'PostmanRuntime/7.30.0',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'authorization': 'admin',
    };
    String newslike = "http://3.108.31.187:8080/get-appkey/6";
    var newsString =
        await http.get(Uri.parse(newslike), headers: requestHeaders);

    print(newsString);
    GlobalWidget.newsJson = adModelFromJson(newsString.body);
    print('-----data----->${GlobalWidget.newsJson?.data[0].keyId}');
    openAds();
  }
}
