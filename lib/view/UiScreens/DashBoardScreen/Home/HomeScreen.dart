import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_calling_app/model/VideoModel.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/Home/VideoCallScreen.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/Live/LiveScreen.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  late HomeProvider hpt;
  late HomeProvider hpf;

  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).list;

    setState(() {
      Provider.of<HomeProvider>(context, listen: false).index = 0;
    });

    super.initState();
  }

  @override
  void dispose() {
    // forback();
    super.dispose();
  }

  // void forback() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const SimpleDialog(
  //         alignment: Alignment.center,
  //         title: Text("Exit"),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    hpt = Provider.of<HomeProvider>(context, listen: true);
    hpf = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      extendBody: true,
      body: GlobalWidget.backgroundColor(
        Stack(
          children: [
            GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: hpf.list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 34.h,
              ),
              itemBuilder: (contest, index) {
                return Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: InkWell(
                    onTap: () {
                      rewardAds();
                      setState(() {
                        isLoading = true;
                      });
                      Timer(const Duration(seconds: 7), () {
                        setState(() {
                          isLoading = false;
                        });
                        hpf.model = VideoModel(
                          name: hpt.list[index].name,
                          image: hpt.list[index].image,
                          video: hpt.list[index].video,
                        );
                        videoController = VideoPlayerController.asset(
                            "${Provider.of<HomeProvider>(context, listen: false).model?.video}")
                          ..initialize().then(
                            (value) {
                              setState(() {
                                videoController.setLooping(true);
                                videoController.play();
                              });
                            },
                          );
                        Navigator.pushNamed(context, "/VideoCallScreen");
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 32.h,
                          // width: 48.w,
                          padding: const EdgeInsets.all(2.5),
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
                                  "${hpf.list[index].image}",
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
                                                color:
                                                    Colors.greenAccent.shade700,
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
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 2),
                                              margin: const EdgeInsets.only(
                                                  left: 3, right: 3),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Text(
                                                "${hpf.list[index].name}",
                                                style: TextStyle(
                                                    color: Colors.red.shade400,
                                                    fontSize: 10.sp,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                            Card(
                                              elevation: 20,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4,
                                                        vertical: 2),
                                                alignment: Alignment.center,
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
                                                        color: Colors
                                                            .redAccent.shade400,
                                                        fontSize: 10.sp),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            isLoading == true
                ? Center(
                    child: Lottie.asset("assets/lottie/loading.json",
                        width: 30.h, height: 30.h),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
