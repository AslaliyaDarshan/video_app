import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class NickNameAddScreen extends StatefulWidget {
  const NickNameAddScreen({Key? key}) : super(key: key);

  @override
  State<NickNameAddScreen> createState() => _NickNameAddScreenState();
}

class _NickNameAddScreenState extends State<NickNameAddScreen> {
  TextEditingController mTeController = TextEditingController();
  bool mBlnValidation = false;
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
      resizeToAvoidBottomInset: false,
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
                GlobalWidget.poppinsText("My NickName", Colors.white, 19.sp,
                    pFontWeight: FontWeight.w500),
                height(5.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: mTeController,
                    cursorColor: Colors.white,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white70, width: 2.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white70, width: 2.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Enter NickName',
                      hintStyle: GoogleFonts.poppins(color: Colors.white),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value) {
                      hpt!.mStrName = value;
                      value.length > 3
                          ? mBlnValidation == false
                          : mBlnValidation == true;
                      setState(() {});
                    },
                  ),
                ),
                mBlnValidation == false
                    ? const Text("")
                    : GlobalWidget.poppinsText(
                        "Please enter attlist 3 latter's", Colors.white, 10.sp),
                height(22.h),
                GlobalWidget.confirmButton(
                  () {
                    if (mTeController.text.length < 3) {
                      mBlnValidation = true;
                      setState(() {});
                    } else {
                      setState(
                        () {
                          interVideoAds();
                          isLoading = true;
                          Future.delayed(
                            const Duration(seconds: 3),
                            () {
                              isLoading = false;
                              Navigator.pushReplacementNamed(context, "/UploadImage");
                            },
                          );
                        },
                      );
                    }
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
