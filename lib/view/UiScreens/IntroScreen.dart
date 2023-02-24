import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: const Color(0xFFFF576F).withOpacity(0.8),
        dotsDecorator: DotsDecorator(
          activeColor: Colors.white,
          color: Colors.pinkAccent.shade200,
          activeSize: const Size(11, 11),
        ),
        done: Text(
          "START",
          style: TextStyle(color: Colors.white, fontSize: 13.sp),
        ),
        next: Icon(
          Icons.arrow_forward,
          size: 21.sp,
          color: Colors.white,
        ),
        showNextButton: true,
        showDoneButton: true,
        onDone: () {
          // interAds();
          Timer(const Duration(milliseconds: 700), () {
            Get.offNamed('/GenderSelect');
          });
        },
        bodyPadding: const EdgeInsets.only(top: 10),
        pages: [
          PageViewModel(
            decoration: pageDecoration(),
            image: image("assets/image/intro.gif"),
            title: "Find",
            body: "Find interesting friends nearby",
          ),
          PageViewModel(
            decoration: pageDecoration(),
            image: image("assets/image/intro1.gif"),
            title: "Chat",
            body: "Share interesting things \n   With friends",
          ),
          PageViewModel(
            decoration: pageDecoration(),
            image: image("assets/image/intro2.gif"),
            title: "Video",
            body: "  Post your Popular videos.",
          ),
          PageViewModel(
            decoration: pageDecoration(),
            image: image("assets/image/intro3.gif"),
            title: "Meet",
            body: "Meet your friends and New Friends.",
          ),
        ],
      )),
    );
  }

  Widget image(pStrUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Image.asset(pStrUrl),
    );
  }

  pageDecoration() {
    return PageDecoration(
      titleTextStyle:
          GoogleFonts.courgette(fontSize: 20.sp, color: Colors.white),
      bodyTextStyle: GoogleFonts.courgette(
          fontSize: 15.sp,
          //fontWeight: FontWeight.w500,
          color: Colors.white),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFF576F).withOpacity(0.7),
              const Color(0xFFFF576F).withOpacity(0.9),
              const Color(0xFFFF576F).withOpacity(0.7),
            ]),
      ),
    );
  }
}
