import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int cnt = 1;
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
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
              Container(
                width: 100.w,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("English", 1),
                        text("Hindi", 2),
                        text("Gujarati", 3),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Marathi", 4),
                        text("Urdu", 5),
                        text("Spanish", 6),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("French", 7),
                        text("Bengali", 8),
                        text("Russian", 9),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Indonesian", 10),
                        text("German", 11),
                        text("Japanese", 12),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Telugu", 13),
                        text("Tamil", 14),
                        text("Chinese", 15),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Korean", 16),
                        text("Nigerian", 17),
                        text("Swahili", 18),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Punjabi", 19),
                        text("Portuguese", 20),
                        text("Iranian", 21),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Turkish", 22),
                        text("Yue Chinese", 23),
                        text("Tagalog", 24),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Hausa	", 25),
                        text("Javanese", 26),
                        text("Kannada", 27),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Thai", 28),
                        text("Amharic", 29),
                        text("Bhojpuri", 30),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Polish", 31),
                        text("Burmese", 32),
                        text("Lingala", 33),
                      ],
                    ),
                    height(8.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  text(String pStrText, int i) {
    return InkWell(
      onTap: () {
        cnt = i;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: cnt == i
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF7452F1).withOpacity(0.7),
                    const Color(0xFF4E67F6).withOpacity(0.8),
                  ],
                )
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFF5531A).withOpacity(0.7),
                    const Color(0xFFFF576F).withOpacity(0.8),
                    const Color(0xFFFF576F).withOpacity(0.8),
                    const Color(0xFFF5531A).withOpacity(0.7),
                  ],
                ),
        ),
        child: GlobalWidget.poppinsText(pStrText, Colors.white, 13.sp),
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
