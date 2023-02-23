import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

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
            const Color(0xFFFF576F),
            const Color(0xFFFF576F).withOpacity(0.8),
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
        margin: const EdgeInsets.only(top: 5, left: 12, right: 12, bottom: 18),
        height: 7.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(0.8),
        ),
        child: Text(
          "Confirm",
          style: TextStyle(
              color: const Color(0xFFFF576F).withOpacity(0.7),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
      ),
    );
  }

  static selectGender(String pStrUrl) {
    return Container(
      height: 22.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(pStrUrl),
      ),
    );
  }

  static poppinsText(String pStrText, Color pClrColor, double pDblFontSize,
      FontWeight pFontWeight) {
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
// color:  Color(0xFFFF576F).withOpacity(0.85),
