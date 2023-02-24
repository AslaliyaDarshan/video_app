import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class GenderSelectScreen extends StatefulWidget {
  const GenderSelectScreen({Key? key}) : super(key: key);

  @override
  State<GenderSelectScreen> createState() => _GenderSelectScreenState();
}

class _GenderSelectScreenState extends State<GenderSelectScreen> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  GlobalWidget.poppinsText("Select Your Gender", Colors.white, 20.sp,pFontWeight: FontWeight.w500 ),
                  height(4.h),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GlobalWidget.selectGender(
                          () {
                             controller.mBlnSelect.value =true;
                            controller.mBlnSelect1.value =false;
                          },
                          "assets/image/man.png",
                          "Male",
                          Border.all(
                            color: controller.mBlnSelect.value == true?Colors.white:Colors.transparent,
                            width:3,
                          ),
                        ),
                        GlobalWidget.selectGender(
                          () {
                            controller.mBlnSelect1.value = true;
                            controller.mBlnSelect.value = false;
                          },
                          "assets/image/female.png",
                          "Female",
                          Border.all(
                            color: controller.mBlnSelect1.value ==false?Colors.transparent:Colors.white,
                            width:3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GlobalWidget.confirmButton(() {
                    Get.offNamed("/UserBirthday");
                  }),
                  GlobalWidget.poppinsText(
                      "Please Select Anyone", Colors.white, 12.sp)
                ],
              ),
              Container(
                height: 16.h,
                color: Colors.white60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
