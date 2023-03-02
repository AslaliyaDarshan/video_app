import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  HomeController controller = Get.put(HomeController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.mStrFileName;
      controller.mStrName;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalWidget.backgroundColor(
        Stack(
          children: [
            SizedBox(
              height: 70.h,
              width: 100.w,
              child: Image.asset(
                "assets/image/pretty-girl.gif",
                fit: BoxFit.fill,
                color: Colors.pink.shade50.withOpacity(0.4),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                height(37.h),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: Colors.white,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.shade200,
                        blurRadius: 20,
                        spreadRadius: 3,
                        offset: const Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.pink.shade200,
                        blurRadius: 20,
                        spreadRadius: 3,
                        offset: const Offset(5, 0),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    maxRadius: 90,
                    backgroundImage: FileImage(File(controller.mStrFileName)),
                  ),
                ),
                GlobalWidget.poppinsText(
                    controller.mStrName, Colors.pink.shade400, 22.sp),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 40.h,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          detail(Icons.person, "Name", controller.mStrName),
                          Divider(
                            color: Colors.pink.shade100,
                            thickness: 2,
                          ),
                          detail(
                              Icons.man,
                              "Gender",
                              (controller.mBlnSelect.value == true)
                                  ? "Male"
                                  : "Female"),
                          Divider(
                            color: Colors.pink.shade100,
                            thickness: 2,
                          ),
                          detail(Icons.calendar_month_rounded, "Age", "18+"),
                          Divider(
                            color: Colors.pink.shade100,
                            thickness: 2,
                          ),
                          detail(Icons.flag, "Region", "India"),
                          Divider(
                            color: Colors.pink.shade100,
                            thickness: 2,
                          ),
                          detail(Icons.language, "Language", "English"),
                          Divider(
                            color: Colors.pink.shade100,
                            thickness: 2,
                          ),
                          detail(Icons.stars_rounded, "My Level", "LV4"),
                          Divider(
                            color: Colors.pink.shade100,
                            thickness: 2,
                          ),
                          height(4.h)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  detail(IconData pIcon, String pStrName, String pStrDetail) {
    return ListTile(
      leading: Container(
        height: 4.5.h,
        width: 4.5.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 3,
            color: Colors.pink.shade300,
          ),
        ),
        child: Icon(pIcon, color: Colors.pink.shade400, size: 20.sp),
      ),
      title: GlobalWidget.poppinsText(pStrName, Colors.pink.shade400, 14.sp),
      trailing: GlobalWidget.poppinsText(pStrDetail, Colors.black, 15.sp,
          pFontWeight: FontWeight.w500),
    );
  }
}
