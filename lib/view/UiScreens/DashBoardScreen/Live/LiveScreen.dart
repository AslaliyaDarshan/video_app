import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';
import 'package:video_player/video_player.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  HomeController controller = Get.put(HomeController());
  late VideoPlayerController videoController;

  int cnt = 0;
  bool isLoading = false;

  @override
  void initState() {
    forVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: dialog,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.list.length,
                  onPageChanged: (value) {
                    setState(() {
                      setState(() {
                        controller.playPause();
                        videoController.pause();
                      });
                      isLoading = true;
                    });
                    Timer(Duration(seconds: 3), () {
                      setState(() {
                        isLoading = false;
                        cnt++;
                      });
                    });
                    if (cnt % 2 == 0) {
                      interAds();
                    }
                    setState(() {
                      controller.playPause();
                      videoController.pause();
                    });
                  },
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 1,
                          width: MediaQuery.of(context).size.width * 1,
                          child: videoController.value.isInitialized
                              ? AspectRatio(
                                  aspectRatio:
                                      videoController.value.aspectRatio,
                                  child: VideoPlayer(videoController))
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.pink.shade300,
                                  ),
                                ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "Live",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.51,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      height(5.h),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 5, bottom: 10),
                                        child: LikeButton(
                                          size: 40,
                                          circleColor: const CircleColor(
                                              start: Colors.pinkAccent,
                                              end: Colors.redAccent),
                                          bubblesColor: const BubblesColor(
                                            dotPrimaryColor: Color(0xff33b5e5),
                                            dotSecondaryColor:
                                                Color(0xff0099cc),
                                          ),
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              isLiked
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isLiked
                                                  ? Colors.red
                                                  : Colors.white,
                                              size: 40,
                                            );
                                          },
                                        ),
                                      ),
                                      PopupMenuButton(
                                        icon: Icon(Icons.more_vert,
                                            color: Colors.white),
                                        padding: const EdgeInsets.only(
                                            right: 4, top: 5),
                                        iconSize: 35,
                                        position: PopupMenuPosition.under,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.pink.shade200,
                                                width: 2.5)),
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: 1,
                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                Icon(Icons.report,
                                                    color: Colors.pink.shade400,
                                                    size: 22.sp),
                                                width(4.w),
                                                GlobalWidget.poppinsText(
                                                    "Report",
                                                    Colors.pink.shade400,
                                                    13.sp),
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: 2,
                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                Icon(Icons.block,
                                                    color: Colors.pink.shade400,
                                                    size: 22.sp),
                                                width(4.w),
                                                GlobalWidget.poppinsText(
                                                    "Block",
                                                    Colors.pink.shade400,
                                                    13.sp),
                                              ],
                                            ),
                                          ),
                                        ],
                                        color: Colors.pink.shade50,
                                        elevation: 5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 13, right: 13, left: 13),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.asset(
                                              "${controller.list[index].image}",
                                              fit: BoxFit.fill,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.1,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.045,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            "${controller.list[index].name}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8, right: 8, left: 8),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.045,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.white, width: 3)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            "assets/image/indianFlag.jpg",
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.045,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void forVideo() {
    Random random = Random();
    int rnd = random.nextInt(controller.list.length);
    videoController =
        VideoPlayerController.asset("${controller.list[rnd].video}")
          ..initialize().then(
            (value) {
              setState(() {
                videoController.setLooping(true);
                videoController.play();
              });
            },
          );
  }

  Future<bool> dialog() async {
    controller.playPause();
    videoController.pause();
    Get.back();
    return await false;
  }

  @override
  dispose() {
    super.dispose();
    dialog();
  }
}
