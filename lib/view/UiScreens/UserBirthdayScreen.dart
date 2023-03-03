import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class UserBirthdayScreen extends StatefulWidget {
  const UserBirthdayScreen({Key? key}) : super(key: key);

  @override
  State<UserBirthdayScreen> createState() => _UserBirthdayScreenState();
}

class _UserBirthdayScreenState extends State<UserBirthdayScreen> {
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
                GlobalWidget.poppinsText(
                    "Select Birthday Date", Colors.white, 19.sp,
                    pFontWeight: FontWeight.w500),
                height(4.h),
                InkWell(
                  onTap: () {
                    timeDialog();
                  },
                  child: Container(
                    height: 7.h,
                    width: 60.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white70,
                          Colors.white,
                          // Colors.white,
                          Colors.white70,
                        ],
                      ),
                    ),
                    child: GlobalWidget.poppinsText(
                        "${hpf!.date.day}/${hpf!.date.month}/${hpf!.date.year}",
                        const Color(0xFFF8256F),
                        15.sp,
                        pFontWeight: FontWeight.w500),
                  ),
                ),
                height(22.h),
                GlobalWidget.confirmButton(
                  () {
                    setState(
                      () {
                        interVideoAds();
                        isLoading = true;
                        Future.delayed(
                          const Duration(seconds: 3),
                          () {
                            isLoading = false;
                            Navigator.pushReplacementNamed(
                                context, "/NickName");
                          },
                        );
                      },
                    );
                  },
                ),
                GlobalWidget.poppinsText(
                    "Not allow to use this app under 18 year",
                    Colors.white,
                    10.sp,
                    pFontWeight: FontWeight.w300),
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

  void timeDialog() async {
    var data = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFD53C79), // <-- SEE HERE
              onPrimary: Color(0xFFFFFFFF), // <-- SEE HERE
              onSurface: Color(0xFFD53C79), // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(0),
      lastDate: DateTime(3000),
    );
    try {
      hpf!.getData(data);
      setState(() {});
    } catch (e) {}
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
