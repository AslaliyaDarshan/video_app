import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            IntroductionScreen(
              key: introKey,
              globalBackgroundColor: const Color(0xFFF66078).withOpacity(0.7),
              dotsDecorator: DotsDecorator(
                activeColor: Colors.white,
                color: Color(0xFF8C8989),
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
                setState(
                  () {
                    interVideoAds();
                    isLoading = true;
                    Timer(
                      const Duration(seconds: 7),
                      () {
                        isLoading = false;
                        Get.offNamed('/GenderSelect');
                      },
                    );
                  },
                );
              },
              pages: [
                PageViewModel(
                    decoration: pageDecoration(),
                    image: image("assets/image/intro.gif"),
                    title: "Find",
                    body: "Find interesting friends nearby",
                    footer: Lottie.asset("assets/lottie/wait.json",
                        fit: BoxFit.fill, width: 2.h, height: 30.h)),
                PageViewModel(
                    decoration: pageDecoration(),
                    image: image("assets/image/intro1.gif"),
                    title: "Chat",
                    body: "Share interesting things \n   With friends",
                    footer: Lottie.asset("assets/lottie/wait.json",
                        fit: BoxFit.fill, width: 2.h, height: 30.h)),
                PageViewModel(
                    decoration: pageDecoration(),
                    image: image("assets/image/intro2.gif"),
                    title: "Video",
                    body: "  Post your Popular videos.",
                    footer: Lottie.asset("assets/lottie/wait.json",
                        fit: BoxFit.fill, width: 2.h, height: 30.h)),
                PageViewModel(
                    decoration: pageDecoration(),
                    image: image("assets/image/intro3.gif"),
                    title: "Meet",
                    body: "Meet your friends and New Friends.",
                    footer: Lottie.asset("assets/lottie/wait.json",
                        fit: BoxFit.fill, width: 2.h, height: 30.h)),
              ],
            ),
            isLoading
                ? Lottie.asset("assets/lottie/loading.json",
                    width: 30.h, height: 30.h)
                : Container(),
          ],
        ),
      ),
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
        color: Colors.white,
      ),
    );
  }
}
