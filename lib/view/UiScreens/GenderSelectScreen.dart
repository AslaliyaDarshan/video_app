import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class GenderSelectScreen extends StatefulWidget {
  const GenderSelectScreen({Key? key}) : super(key: key);

  @override
  State<GenderSelectScreen> createState() => _GenderSelectScreenState();
}

class _GenderSelectScreenState extends State<GenderSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GlobalWidget.backgroundColor(
          Column(
            children: [
              height(5.h),
              Text(
                "Select Your Gender",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
              height(4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GlobalWidget.selectGender("assets/image/man.png"),
                  GlobalWidget.selectGender("assets/image/female.png"),
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GlobalWidget.selectGender("assets/image/man.png"),
                  GlobalWidget.selectGender("assets/image/female.png"),
                ],
              ),
              GlobalWidget.confirmButton(() {
                Navigator.pushReplacementNamed(context, "/UserBirthday");
              }),
            ],
          ),
        ),
      ),
    );
  }
}
