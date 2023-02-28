import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class UserBirthdayScreen extends StatefulWidget {
  const UserBirthdayScreen({Key? key}) : super(key: key);

  @override
  State<UserBirthdayScreen> createState() => _UserBirthdayScreenState();
}

class _UserBirthdayScreenState extends State<UserBirthdayScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalWidget.backgroundColor(
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  height: 20.h,
                  color: Colors.white60,
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
                        "${controller.date.day}/${controller.date.month}/${controller.date.year}",
                        const Color(0xFFF8256F),
                        15.sp,
                        pFontWeight: FontWeight.w500),
                  ),
                ),
                height(22.h),
                GlobalWidget.confirmButton(
                  () {
                    Get.offNamed("/NickName");
                  },
                ),
                GlobalWidget.poppinsText(
                    "Not allow to use this app under 18 year",
                    Colors.white,
                    10.sp,
                    pFontWeight: FontWeight.w300),
              ],
            ),
            Container(
              height: 16.h,
              color: Colors.white60,
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
      if (mounted) {
        setState(
          () {
            controller.getData(data);
          },
        );
      }
      ;
    } catch (e) {}
  }
}
