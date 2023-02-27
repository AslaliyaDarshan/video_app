import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalWidget.backgroundColor(
        Container(
          height: 95.h,
          width: 100.w,
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Wrap(
            direction: Axis.vertical,
            spacing: 15,
            runSpacing: 10,
            children: [
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
              text("Darshan"),
            ],
          ),
        ),
      ),
    );
  }

  text(String pStrText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
      child: GlobalWidget.poppinsText(pStrText, Colors.white, 15.sp),
    );
  }
}
