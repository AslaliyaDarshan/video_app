import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_calling_app/view/ApiHelper/ApiHelperClass.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class GenderSelectScreen extends StatefulWidget {
  const GenderSelectScreen({Key? key}) : super(key: key);

  @override
  State<GenderSelectScreen> createState() => _GenderSelectScreenState();
}

class _GenderSelectScreenState extends State<GenderSelectScreen> {
  HomeController controller = Get.put(HomeController());
  NativeAd? nativeAd;
  bool isAdLoaded = false;
  bool isLoading = false;

  @override
  void initState() {
    native();
    bannerAds();
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
                    "Select Your Gender", Colors.white, 20.sp,
                    pFontWeight: FontWeight.w500),
                height(4.h),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GlobalWidget.selectGender(
                        () {
                          controller.mBlnSelect.value = true;
                          controller.mBlnSelect1.value = false;
                        },
                        "assets/image/man.png",
                        "Male",
                        Border.all(
                          color: controller.mBlnSelect.value == true
                              ? Colors.white
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      GlobalWidget.selectGender(
                        () {
                          controller.mBlnSelect1.value = true;
                          controller.mBlnSelect.value = false;
                        },
                        "assets/image/female.png",
                        "Female",
                        Border.all(
                          color: controller.mBlnSelect1.value == false
                              ? Colors.transparent
                              : Colors.white,
                          width: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                GlobalWidget.confirmButton(
                  () {
                    setState(
                      () {
                        interVideoAds();
                        isLoading = true;
                        Future.delayed(
                          const Duration(seconds: 5),
                          () {
                            isLoading = false;
                            Get.offNamed("/UserBirthday");
                          },
                        );
                      },
                    );
                  },
                ),
                GlobalWidget.poppinsText(
                    "Please Select Anyone", Colors.white, 12.sp)
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
