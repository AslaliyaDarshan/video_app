import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
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
                        text("India", 1),
                        text("Pakistan", 2),
                        text("United State", 3),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Grenada", 4),
                        text("Romania", 5),
                        text("Malaysia", 6),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Chile", 7),
                        text("Malawi", 8),
                        text("Portugal", 9),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Tajikistan", 10),
                        text("Monaco", 11),
                        text("Iceland", 12),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Canada", 13),
                        text("switzerland", 14),
                        text("Australia", 15),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Chine", 16),
                        text("Kuwait", 17),
                        text("Thailand", 18),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("France", 19),
                        text("Finland", 20),
                        text("Iran", 21),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Italy", 22),
                        text("France", 23),
                        text("Japan", 24),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Malaysia", 25),
                        text("Nepal", 26),
                        text("New Zealand", 27),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Spain", 28),
                        text("Ukraine", 29),
                        text("Germany", 30),
                      ],
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Greece", 31),
                        text("Ireland", 32),
                        text("Sri Lanka", 33),
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
