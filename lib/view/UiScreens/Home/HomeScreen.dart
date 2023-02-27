import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/model/VideoModel.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalWidget.backgroundColor(
        GridView.builder(
          itemCount: controller.list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 37.h,
          ),
          itemBuilder: (contest, index) {
            return Padding(
              padding: EdgeInsets.all(5.sp),
              child: InkWell(
                onTap: () {
                  // rewardAds();
                  // setState(() {
                  //   isloading = true;
                  // });
                  Timer(const Duration(seconds: 1), () {
                    controller.model = VideoModel(
                      name: controller.list[index].name,
                      image: controller.list[index].image,
                      video: controller.list[index].video,
                    );
                    Get.toNamed("/VideoCallScreen");
                    //   setState(() {
                    //     isloading = false;
                    //   });
                    //   home_providerf!.Datapickkk = Modeldata2(
                    //     Name2: home_providerf!.i1[index].Name2,
                    //     Image2: home_providerf!.i1[index].Image2,
                    //     video: home_providerf!.i1[index].video,
                    //   );
                    //   Navigator.pushNamed(context, 'play');
                  });
                },
                child: Column(
                  children: [
                    Container(
                      height: 35.h,
                      // width: 48.w,
                      padding: const EdgeInsets.all(3.5),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        border: Border.all(width: 3, color: Colors.white70),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "${controller.list[index].image}",
                              fit: BoxFit.fill,
                              height: 35.h,
                              width: 48.w,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Container(
                                          height: 1.3.h,
                                          width: 1.3.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors
                                                .greenAccent.shade700,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Online",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.5.sp),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2.0.sp),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                          width: 3.h,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            child: Image.asset(
                                                "assets/image/indianFlag.jpg",
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1.h,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 5,
                                                  vertical: 3),
                                          margin: const EdgeInsets.only(left: 3,right: 3),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "${controller.list[index].name}",
                                            style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontSize: 12.sp),
                                          ),
                                        ),
                                        Card(
                                          elevation: 20,
                                          child: Container(
                                            height: 3.h,
                                            width: 7.h,
                                            decoration: BoxDecoration(
                                              color:
                                                  const Color(0xFFFFFFfF),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "❤ 10k",
                                                style: TextStyle(
                                                    color: Colors.redAccent
                                                        .shade400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
