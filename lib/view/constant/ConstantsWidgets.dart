import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';

class GlobalWidget {
  static backgroundColor(Widget child) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFF576F).withOpacity(0.7),
            const Color(0xFFFF576F).withOpacity(0.9),
            const Color(0xFFFF576F).withOpacity(0.7),
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
        height: 7.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(0.8),
          boxShadow: const [
            BoxShadow(
              color: Colors.white70,
              blurRadius: 10,
              spreadRadius: 1.0,
              offset: Offset(
                -3.0,
                -3.0,
              ),
            ),
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              spreadRadius: 1.0,
              offset: Offset(
                3.0,
                3.0,
              ),
            )
          ],
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
              boxShadow: const [
                BoxShadow(
                  color: Colors.white60,
                  blurRadius: 15,
                  spreadRadius: 0.2,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                )
              ],
              border: pBorder,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(pStrUrl,height:25.h,
                width: 45.w,
                fit: BoxFit.fill,),
            ),
          ),
          poppinsText(pStrText,Colors.white, 15.sp)
        ],
      ),
    );
  }static selectGender(
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
              boxShadow: const [
                BoxShadow(
                  color: Colors.white60,
                  blurRadius: 15,
                  spreadRadius: 0.2,
                  offset: Offset(
                    5.0,
                    5.0,
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
