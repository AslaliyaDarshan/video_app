import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class SelectYourGoalScreen extends StatefulWidget {
  const SelectYourGoalScreen({Key? key}) : super(key: key);

  @override
  State<SelectYourGoalScreen> createState() => _SelectYourGoalScreenState();
}

class _SelectYourGoalScreenState extends State<SelectYourGoalScreen> {
  // HomeController controller = Get.put(HomeController());
  NativeAd? nativeAd;
  bool isAdLoaded = false;
  bool isLoading = false;
  late HomeProvider hpt;
  late HomeProvider hpf;

  @override
  void initState() {
    native();
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
                GlobalWidget.poppinsText(
                    "Select Your Goal", Colors.white, 20.sp,
                    pFontWeight: FontWeight.w500),
                height(2.h),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GlobalWidget.selectYourGoal(
                          () {
                            setState(() {
                              hpt.mBlnSelect = true;
                              hpt.mBlnSelect1 = false;
                              hpt.mBlnSelect2 = false;
                              hpt.mBlnSelect3 = false;
                            });
                          },
                          "assets/image/goal.jpg",
                          "Love",
                          Border.all(
                            color: hpf.mBlnSelect == true
                                ? Colors.white
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        GlobalWidget.selectYourGoal(
                          () {
                            setState(() {
                              hpt.mBlnSelect = false;
                              hpt.mBlnSelect1 = true;
                              hpt.mBlnSelect2 = false;
                              hpt.mBlnSelect3 = false;
                            });
                          },
                          "assets/image/goal1.jpg",
                          "Only Girl",
                          Border.all(
                            color: hpf.mBlnSelect1 == false
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
                            setState(() {
                              hpt.mBlnSelect = false;
                              hpt.mBlnSelect1 = false;
                              hpt.mBlnSelect2 = true;
                              hpt.mBlnSelect3 = false;
                            });
                          },
                          "assets/image/goal2.jpg",
                          "Relationship",
                          Border.all(
                            color: hpf.mBlnSelect2 == true
                                ? Colors.white
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        GlobalWidget.selectYourGoal(
                          () {
                            setState(() {
                              hpt.mBlnSelect = false;
                              hpt.mBlnSelect1 = false;
                              hpt.mBlnSelect2 = false;
                              hpt.mBlnSelect3 = true;
                            });
                          },
                          "assets/image/goal3.jpg",
                          "Love Couple",
                          Border.all(
                            color: hpf.mBlnSelect3 == false
                                ? Colors.transparent
                                : Colors.white,
                            width: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                height(2.h),
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
                            Navigator.pushReplacementNamed(
                                context, "/SelectGenderForVideo");
                            // Get.toNamed("/SelectGenderForVideo");
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
