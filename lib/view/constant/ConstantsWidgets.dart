import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/model/ApiModel.dart';

class GlobalWidget {
  static AdModel? newsJson;
  static dynamic openAd = newsJson!.data[0].keyId;
  static dynamic bannerAd = newsJson!.data[1].keyId;
  static dynamic interstitialAd = newsJson!.data[2].keyId;
  static dynamic interstitialVideoAd = newsJson!.data[3].keyId;
  static dynamic rewardedAd = newsJson!.data[4].keyId;
  static dynamic nativeAd = newsJson!.data[5].keyId;

  static backgroundColor(Widget child) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
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
      child: child,
    );
  }

  static confirmButton(void Function() onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 18),
        height: 6.5.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Text(
          "Confirm",
          style: TextStyle(
              color: const Color(0xFFF6405A).withOpacity(0.7),
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5),
        ),
      ),
    );
  }

  static selectYourGoal(
      void Function() onTap, String pStrUrl, String pStrText, Border pBorder) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 27.h,
            width: 43.w,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 0.5,
                  offset: Offset(
                    2.0,
                    2.0,
                  ),
                )
              ],
              border: pBorder,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                pStrUrl,
                height: 25.h,
                width: 45.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: poppinsText(pStrText, Colors.white, 13.sp),
          ),
        ],
      ),
    );
  }

  static selectGender(
      void Function() onTap, String pStrUrl, String pStrText, Border pBorder) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 22.h,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 0.5,
                  offset: Offset(
                    2.0,
                    2.0,
                  ),
                )
              ],
              border: pBorder,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(pStrUrl),
            ),
          ),
          height(2.h),
          GlobalWidget.poppinsText(pStrText, Colors.white, 15.sp,
              pFontWeight: FontWeight.w400),
          height(3.h),
        ],
      ),
    );
  }

  static poppinsText(String pStrText, Color pClrColor, double pDblFontSize,
      {FontWeight? pFontWeight}) {
    return Text(
      pStrText,
      style: GoogleFonts.poppins(
        color: pClrColor,
        fontSize: pDblFontSize,
        fontWeight: pFontWeight,
      ),
    );
  }

  static warningDialog(String pStrTitle, String pStrWarningText,
      {void Function()? onTap, void Function()? onTaps}) {
    return Get.defaultDialog(
      title: pStrTitle,
      titleStyle: TextStyle(color: const Color(0xFFF6405A).withOpacity(0.7)),
      content: GlobalWidget.poppinsText(
          pStrWarningText, const Color(0xFFF6405A).withOpacity(0.7), 12.sp),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [button(onTap!, "Cancel"), button(onTaps!, "Ok")],
          ),
        ),
      ],
    );
  }

  static button(void Function() onTap, String pStrText) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 5.h,
        width: 20.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF6405A).withOpacity(0.75),
          borderRadius: BorderRadius.circular(25),
        ),
        child: GlobalWidget.poppinsText(pStrText, Colors.white, 12.sp),
      ),
    );
  }
}

Widget height(double height) {
  return SizedBox(
    height: height,
  );
}

Widget width(double width) {
  return SizedBox(
    width: width,
  );
}
