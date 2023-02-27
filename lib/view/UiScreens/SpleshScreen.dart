import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
          () => Get.offNamed( "/TermsScreen"),
    );
    super.initState();
  }
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
}
