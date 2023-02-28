import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';

import '../constant/ConstantsWidgets.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File file = File("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalWidget.backgroundColor(
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 35),
                  ),
                ),
                Container(
                  height: 18.h,
                  color: Colors.deepOrange,
                ),
                GlobalWidget.poppinsText(
                    "Upload Your Image", Colors.white, 20.sp,
                    pFontWeight: FontWeight.w700),
                height(12.h),
                InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    height: 20.h,
                    width: 20.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white30,
                    ),
                    child: file.path.isEmpty
                        ? Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 5),
                            ),
                            child: const Icon(
                              Icons.photo_camera_outlined,
                              color: Colors.white,
                              size: 70,
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(file),
                          ),
                  ),
                ),
                height(17.h),
                GlobalWidget.confirmButton(
                  () {
                    HomeController.homeController.mStrFileName = file.path;
                    file.path.isEmpty
                        ? GlobalWidget.warningDialog("Please Upload Image")
                        : Get.toNamed("/SelectYourGoal");
                  },
                ),
                InkWell(
                  onTap: () {
                    Get.offNamed("/SelectYourGoal");
                  },
                  child: GlobalWidget.poppinsText("Skip", Colors.white, 16.sp,
                      pFontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  pickImage() {
    showModalBottomSheet(
      backgroundColor: Colors.purple.shade600,
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              text(() async {
                ImagePicker img = ImagePicker();
                XFile? f2 = await img.pickImage(source: ImageSource.camera);
        if (mounted) {setState(() {
                  try {
                    file = File(f2!.path);
                  } catch (e) {}
                });};
                Get.back();
              }, "Take Photo"),
              text(() async {
                ImagePicker img = ImagePicker();
                XFile? f2 = await img.pickImage(source: ImageSource.gallery);
                if (mounted) {
                  setState(
                    () {
                      try {
                        file = File(f2!.path);
                      } catch (e) {}
                    },
                  );
                }
                ;
                Get.back();
              }, "Choose From Library"),
              text(() {
                Get.back();
              }, "Cancel"),
            ],
          ),
        );
      },
    );
  }

  button(String pStrText) {
    return InkWell(
      onTap: () => Get.back(),
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

  text(void Function() onTap, String pStrText) {
    return InkWell(
      onTap: onTap,
      child: GlobalWidget.poppinsText(
          pStrText, const Color(0xFFF6405A).withOpacity(0.7), 12.sp,
          pFontWeight: FontWeight.w500),
    );
  }
}
