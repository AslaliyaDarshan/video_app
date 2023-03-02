import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class SelectYourGoalScreen extends StatefulWidget {
  const SelectYourGoalScreen({Key? key}) : super(key: key);

  @override
  State<SelectYourGoalScreen> createState() => _SelectYourGoalScreenState();
}

class _SelectYourGoalScreenState extends State<SelectYourGoalScreen> {
  HomeController controller = Get.put(HomeController());
  NativeAd? nativeAd;
  bool isAdLoaded = false;
  bool isLoading = false;

  @override
  void initState() {
    native();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                GlobalWidget.poppinsText(
                    "Select Your Goal", Colors.white, 20.sp,
                    pFontWeight: FontWeight.w500),
                height(2.h),
                Obx(
                  () => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GlobalWidget.selectYourGoal(
                            () {
                              controller.mBlnSelect.value = true;
                              controller.mBlnSelect1.value = false;
                              controller.mBlnSelect2.value = false;
                              controller.mBlnSelect3.value = false;
                            },
                            "assets/image/goal.jpg",
                            "Love",
                            Border.all(
                              color: controller.mBlnSelect.value == true
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          GlobalWidget.selectYourGoal(
                            () {
                              controller.mBlnSelect.value = false;
                              controller.mBlnSelect1.value = true;
                              controller.mBlnSelect2.value = false;
                              controller.mBlnSelect3.value = false;
                            },
                            "assets/image/goal1.jpg",
                            "Only Girl",
                            Border.all(
                              color: controller.mBlnSelect1.value == false
                                  ? Colors.transparent
                                  : Colors.white,
                              width: 3,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GlobalWidget.selectYourGoal(
                            () {
                              controller.mBlnSelect.value = false;
                              controller.mBlnSelect1.value = false;
                              controller.mBlnSelect2.value = true;
                              controller.mBlnSelect3.value = false;
                            },
                            "assets/image/goal2.jpg",
                            "Relationship",
                            Border.all(
                              color: controller.mBlnSelect2.value == true
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          GlobalWidget.selectYourGoal(
                            () {
                              controller.mBlnSelect.value = false;
                              controller.mBlnSelect1.value = false;
                              controller.mBlnSelect2.value = false;
                              controller.mBlnSelect3.value = true;
                            },
                            "assets/image/goal3.jpg",
                            "Love Couple",
                            Border.all(
                              color: controller.mBlnSelect3.value == false
                                  ? Colors.transparent
                                  : Colors.white,
                              width: 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height(2.h),
                GlobalWidget.confirmButton(
                  () {
                    setState(
                      () {
                        rewardAds();
                        isLoading = true;
                        Future.delayed(
                          const Duration(seconds: 5),
                          () {
                            isLoading = false;
                            Get.toNamed("/SelectGenderForVideo");
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            isLoading
                ? Center(
                    child: Lottie.asset("assets/lottie/loading.json",
                        width: 30.h, height: 30.h),
                  )
                : Container(),
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
