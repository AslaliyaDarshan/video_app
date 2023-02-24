import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class SelectYourGoalScreen extends StatefulWidget {
  const SelectYourGoalScreen({Key? key}) : super(key: key);

  @override
  State<SelectYourGoalScreen> createState() => _SelectYourGoalScreenState();
}

class _SelectYourGoalScreenState extends State<SelectYourGoalScreen> {
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
                  GlobalWidget.poppinsText(
                      "Select Your Goal", Colors.white, 20.sp,
                      pFontWeight: FontWeight.w500),
                  height(2.h),
                  Obx(
                    () => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GlobalWidget.selectYourGoal(
                              () {
                                controller.mBlnSelect.value = true;
                                controller.mBlnSelect1.value = false;
                                controller.mBlnSelect2.value = false;
                                controller.mBlnSelect3.value = false;
                              },
                              "assets/image/goal.jpg",
                              "Male",
                              Border.all(
                                color: controller.mBlnSelect.value == true
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                            GlobalWidget.selectYourGoal(
                              () {
                                controller.mBlnSelect.value = false;
                                controller.mBlnSelect1.value = true;
                                controller.mBlnSelect2.value = false;
                                controller.mBlnSelect3.value = false;
                              },
                              "assets/image/goal1.jpg",
                              "Female",
                              Border.all(
                                color: controller.mBlnSelect1.value == false
                                    ? Colors.transparent
                                    : Colors.white,
                                width: 3,
                              ),
                            ),
                          ],
                        ),Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GlobalWidget.selectYourGoal(
                              () {
                                controller.mBlnSelect.value = false;
                                controller.mBlnSelect1.value = false;
                                controller.mBlnSelect2.value = true;
                                controller.mBlnSelect3.value = false;
                              },
                              "assets/image/goal2.jpg",
                              "Male",
                              Border.all(
                                color: controller.mBlnSelect2.value == true
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                            GlobalWidget.selectYourGoal(
                              () {
                                controller.mBlnSelect.value = false;
                                controller.mBlnSelect1.value = false;
                                controller.mBlnSelect2.value = false;
                                controller.mBlnSelect3.value = true;
                              },
                              "assets/image/goal3.jpg",
                              "Female",
                              Border.all(
                                color: controller.mBlnSelect3.value == false
                                    ? Colors.transparent
                                    : Colors.white,
                                width: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GlobalWidget.confirmButton(
                    () {
                      Get.offNamed("/SelectGenderForVideo");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
