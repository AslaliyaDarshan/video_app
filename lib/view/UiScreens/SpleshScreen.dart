import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/ApiHelper/ApiHelperClass.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

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
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      print("internet---------->$isDeviceConnected");
      if (isDeviceConnected == false && isAlertSet == false) {
        showDialogBox();
        if (mounted) {
          setState(() {
            isAlertSet = true;
          });
        }
      } else {
        ApiHelper().AdData();
        isLogin();
      }
    });
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
                  if (mounted) {
                    setState(() {
                      isAlertSet = false;
                    });
                  }
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showDialogBox();
                    if (mounted) {
                      setState(() {
                        isAlertSet = true;
                      });
                    }
                  } else {
                    ApiHelper().AdData();
                    isLogin();
                  }
                },
                child: const Text("ok"))
          ],
        );
      },
    );
  }

  void isLogin() async {
    if (isDeviceConnected == false) {
      showDialogBox();
    } else {
      Timer(
        const Duration(seconds: 7),
        () => Get.offAllNamed("/TermsScreen"),
      );
      // }
    }
  }
}
