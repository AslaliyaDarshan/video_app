import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/Live/LiveScreen.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class SelectGenderForVideoScreen extends StatefulWidget {
  const SelectGenderForVideoScreen({Key? key}) : super(key: key);

  @override
  State<SelectGenderForVideoScreen> createState() =>
      _SelectGenderForVideoScreenState();
}

class _SelectGenderForVideoScreenState
    extends State<SelectGenderForVideoScreen> {
  // HomeController controller = Get.put(HomeController());
  NativeAd? nativeAd;
  bool isAdLoaded = false;
  bool isLoading = false;
  HomeProvider? hpt;
  HomeProvider? hpf;

  @override
  void initState() {
    native();
    bannerAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    hpt = Provider.of<HomeProvider>(context, listen: true);
    hpf = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: GlobalWidget.backgroundColor(
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                isAdLoaded
                    ? Container(
                        height: 20.h,
                        padding: EdgeInsets.only(top: 5.h),
                        alignment: Alignment.center,
                        child: AdWidget(ad: nativeAd!),
                      )
                    : Container(
                        height: 20.h,
                        padding: EdgeInsets.only(top: 5.h),
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                height(10.h),
                GlobalWidget.poppinsText(
                    "Select Gender for VideoCall", Colors.white, 16.sp,
                    pFontWeight: FontWeight.w500),
                height(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GlobalWidget.selectYourGoal(
                      () {
                        hpt!.mBlnSelect = true;
                        hpt!.mBlnSelect1 = false;
                        setState(
                          () {
                            interVideoAds();
                            isLoading = true;
                            Future.delayed(
                              const Duration(seconds: 5),
                              () {
                                isLoading = false;
                                Navigator.pushReplacementNamed(
                                    context, "/DashBoard");
                              },
                            );
                          },
                        );
                      },
                      "assets/image/boy.jpg",
                      "Male",
                      Border.all(
                        color: hpf!.mBlnSelect == true
                            ? Colors.white
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    GlobalWidget.selectYourGoal(
                      () {
                        hpt!.mBlnSelect1 = true;
                        hpt!.mBlnSelect = false;
                        setState(
                          () {
                            interVideoAds();
                            isLoading = true;
                            Future.delayed(
                              const Duration(seconds: 5),
                              () {
                                isLoading = false;
                                Navigator.pushReplacementNamed(
                                    context, "/DashBoard");
                              },
                            );
                          },
                        );
                      },
                      "assets/image/girl.webp",
                      "Female",
                      Border.all(
                        color: hpf!.mBlnSelect1 == false
                            ? Colors.transparent
                            : Colors.white,
                        width: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            isLoading
                ? Center(
                    child: Lottie.asset("assets/lottie/loading.json",
                        width: 30.h, height: 30.h),
                  )
                : Container(),
            Container(
              height: 9.h,
              alignment: Alignment.bottomCenter,
              child: AdWidget(ad: bannerAd!),
            ),
          ],
        ),
      ),
    );
  }

  native() {
    try {
      nativeAd = NativeAd(
        adUnitId: "${GlobalWidget.nativeAd}",
        factoryId: 'listTile',
        request: const AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: (_) {
            setState(
              () {
                isAdLoaded = true;
              },
            );
          },
          onAdFailedToLoad: (ad, error) {
            native();
          },
        ),
      );
      nativeAd?.load();
    } on Exception {}
  }
}
