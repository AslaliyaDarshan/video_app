import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:video_calling_app/model/ApiModel.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
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
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (isDeviceConnected == false && isAlertSet == false) {
          setState(
            () => {
              showDialogBox(),
              isAlertSet = true,
            },
          );
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
                  setState(() {
                    isAlertSet = false;
                  });
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showDialogBox();
                    setState(() {
                      isAlertSet = true;
                    });
                  } else {
                    getAd();
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
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, "/SelectGenderForVideo");
        //  Navigator.pushReplacementNamed(context, "/TermsScreen");
      });
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
    String newslike = "http://3.108.31.187:8080/get-appkey/9";
    var newsString =
        await http.get(Uri.parse(newslike), headers: requestHeaders);

    print(newsString);
    GlobalWidget.newsJson = adModelFromJson(newsString.body);
    print('-----data----->${GlobalWidget.newsJson?.data[0].keyId}');
    openAds();
  }
}
