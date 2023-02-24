import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class SelectGenderForVideoScreen extends StatefulWidget {
  const SelectGenderForVideoScreen({Key? key}) : super(key: key);

  @override
  State<SelectGenderForVideoScreen> createState() => _SelectGenderForVideoScreenState();
}

class _SelectGenderForVideoScreenState extends State<SelectGenderForVideoScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
                height(10.h),

                GlobalWidget.poppinsText("Select Gender for VideoCall", Colors.white, 16.sp,pFontWeight: FontWeight.w500 ),
                height(8.h),
                Obx(
                      () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GlobalWidget.selectYourGoal(
                            () {
                          controller.mBlnSelect.value =true;
                          controller.mBlnSelect1.value =false;
                          Timer(Duration(milliseconds: 1000), () {Get.toNamed("/HomeScreen");});
                        },
                        "assets/image/boy.jpg",
                        "Male",
                        Border.all(
                          color: controller.mBlnSelect.value == true?Colors.white:Colors.transparent,
                          width:3,
                        ),
                      ),
                      GlobalWidget.selectYourGoal(
                            () {
                          controller.mBlnSelect1.value = true;
                          controller.mBlnSelect.value = false;
                          Timer(Duration(milliseconds: 1000), () {Get.toNamed("/HomeScreen");});
                        },
                        "assets/image/girl.webp",
                        "Female",
                        Border.all(
                          color: controller.mBlnSelect1.value ==false?Colors.transparent:Colors.white,
                          width:3,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            Container(
              height: 16.h,
              color: Colors.white60,
            ),
          ],
        ),
      ),
    ),);
  }
}
