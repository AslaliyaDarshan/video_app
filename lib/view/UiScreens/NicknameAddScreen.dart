import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class NickNameAddScreen extends StatefulWidget {
  const NickNameAddScreen({Key? key}) : super(key: key);

  @override
  State<NickNameAddScreen> createState() => _NickNameAddScreenState();
}

class _NickNameAddScreenState extends State<NickNameAddScreen> {
  TextEditingController mTeController = TextEditingController();
  bool mBlnValidation = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  GlobalWidget.poppinsText("My NickName", Colors.white, 19.sp,
                      pFontWeight: FontWeight.w500),
                  height(5.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: mTeController,
                      cursorColor: Colors.white,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white70, width: 2.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white70, width: 2.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: 'Enter NickName',
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {

                        value.length > 3?mBlnValidation == false
                            :mBlnValidation == true;
                        });
                      },
                    ),
                  ),
                  mBlnValidation == false
                      ? const Text("")
                      : GlobalWidget.poppinsText(
                          "Please enter attlist 3 latter's",
                          Colors.white,
                          10.sp),
                  height(22.h),
                  GlobalWidget.confirmButton(
                    () { if (mTeController.text.length < 3) {
                      setState(() {
                        mBlnValidation = true;
                      });
                    } else {
                      Get.offNamed("/UploadImage");
                    }

                    },
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed("/UploadImage");
                    },
                    child: GlobalWidget.poppinsText("Skip", Colors.white, 16.sp,
                        pFontWeight: FontWeight.w500),
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
      ),
    );
  }
}
