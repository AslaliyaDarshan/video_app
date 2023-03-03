import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/DashBoardScreen.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';
import 'package:video_player/video_player.dart';

late VideoPlayerController playerController;

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  late HomeProvider hpt;
  late HomeProvider hpf;
  int cnt = 0;
  bool isLoading = false;
  bool change = false;
  late VideoPlayerController playerController;

  @override
  void initState() {
    forVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    hpt = Provider.of<HomeProvider>(context, listen: true);
    hpf = Provider.of<HomeProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: dialog,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Swiper(
              scrollDirection: Axis.vertical,
              itemCount: hpf.list.length,
              onIndexChanged: (value) {
                setState(() {
                  isLoading = true;
                });
                Timer(const Duration(seconds: 3), () {
                  setState(() {
                    isLoading = false;
                    cnt++;
                  });
                });
                if (cnt % 2 == 0) {
                  interAds();
                  // interVideoAds();
                }
                forVideo();
              },
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 1,
                      child: playerController.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: playerController.value.aspectRatio,
                              child: VideoPlayer(playerController))
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
                                Navigator.pushReplacementNamed(
                                    context, "/DashBoard");
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
                                        dotSecondaryColor: Color(0xff0099cc),
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
                                    icon: const Icon(Icons.more_vert,
                                        color: Colors.white),
                                    padding:
                                        const EdgeInsets.only(right: 4, top: 5),
                                    iconSize: 35,
                                    position: PopupMenuPosition.under,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.pink.shade200,
                                            width: 2.5)),
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 1,
                                        child: InkWell(
                                          onTap: () {
                                            reportDialog();
                                          },
                                          child: SizedBox(
                                            height: 25,
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
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 2,
                                        child: InkWell(
                                          onTap: () {
                                            GlobalWidget.warningDialog(
                                                "Block Video",
                                                "Block Video Please Enter Ok.",
                                                onTap: () {
                                              Navigator.pop(context);
                                            }, onTaps: () {
                                              dialog();
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.block,
                                                  color: Colors.pink.shade400,
                                                  size: 22.sp),
                                              width(4.w),
                                              GlobalWidget.poppinsText("Block",
                                                  Colors.pink.shade400, 13.sp),
                                            ],
                                          ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 13, right: 13, left: 13),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          "${hpf.list[index].image}",
                                          fit: BoxFit.fill,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.048,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.048,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "${hpf.list[index].name}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, right: 8, left: 8),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height: MediaQuery.of(context).size.height *
                                        0.045,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.white, width: 3)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/image/indianFlag.jpg",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        height:
                                            MediaQuery.of(context).size.height *
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
    );
  }

  void forVideo() {
    Random random = Random();
    int rnd = random
        .nextInt(Provider.of<HomeProvider>(context, listen: false).list.length);
    playerController = VideoPlayerController.asset(
        "${Provider.of<HomeProvider>(context, listen: false).list[rnd].video}")
      ..initialize().then(
        (value) {
          setState(
            () {
              // playerController.setLooping(true);
              // playerController.play();
            },
          );
        },
      );
  }

  reportDialog() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return InkWell(
          onTap: () {
            back();
          },
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.5.h),
                        child: Container(
                          height: 0.5.h,
                          width: 18.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Report",
                          style: TextStyle(
                              color: Colors.pink.shade200,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp),
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Why are you reporting this post?",
                      style: TextStyle(
                          color: Colors.pink.shade200,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                      style: TextStyle(color: Colors.pink.shade100),
                    ),
                    text("I just don't like it"),
                    text("it's spam"),
                    text("Nudity or sexual activity"),
                    text("Hate speech or symbols"),
                    text("Violence or dangerous organisations"),
                    text("False information"),
                    text("Bullying or harassment"),
                    text("Scam or fraud"),
                    text("Intellectual property violation"),
                    text("Suicide or self-injury"),
                    text("Sale of illegal or regulated goods"),
                    text("Eating disorders"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  text(String pStrText) {
    return InkWell(
      onTap: () {
        dialog();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Text(
          pStrText,
          style: TextStyle(
              color: Colors.pink.shade200,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Future<bool> dialog() async {
    Provider.of<HomeProvider>(context, listen: false).playPause();
    playerController.pause();
    back();
    return await false;
  }

  back() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DashBoardScreen()));
  }

  @override
  dispose() {
    super.dispose();
    dialog();
  }
}
/*
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_calling_app/view/ApiHelper/AdScreen.dart';
import 'package:video_player/video_player.dart';

late VideoPlayerController playerController;

class Live_Screen extends StatefulWidget {
  const Live_Screen({Key? key}) : super(key: key);

  @override
  State<Live_Screen> createState() => _Live_ScreenState();
}

class _Live_ScreenState extends State<Live_Screen> {
  int cnt = 0;

  @override
  void initState() {
    super.initState();
    forvideo();
  }

  HomeProvider? home_providerf;
  HomeProvider? home_providert;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    home_providerf = Provider.of<HomeProvider>(context, listen: false);
    home_providert = Provider.of<HomeProvider>(context, listen: true);
    return WillPopScope(
      onWillPop: dialog,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: home_providerf!.list.length,
                onPageChanged: (value) {
                  setState(() {
                    isloading = true;
                  });
                  Timer(Duration(seconds: 3), () {
                    setState(() {
                      isloading = false;
                      cnt++;
                    });
                  });
                  if (cnt % 2 == 0) {
                    interAds();
                  }
                  forvideo();
                },
                itemBuilder: (Contest, index) {
                  return Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 1,
                            width: MediaQuery.of(context).size.width * 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: playerController.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio:
                                          playerController.value.aspectRatio,
                                      child: VideoPlayer(playerController))
                                  : Center(
                                      child: const CircularProgressIndicator(
                                        color: Colors.green,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'bottom');
                                },
                              ),
                              Padding(
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
                            height: MediaQuery.of(context).size.height * 0.55,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: LikeButton(
                                          size: 40,
                                          circleColor: CircleColor(
                                              start: Colors.pinkAccent,
                                              end: Colors.redAccent),
                                          bubblesColor: BubblesColor(
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
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
                                            "${home_providerf!.list[index].image}",
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
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          "${home_providerf!.list[index].name}",
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
                                      width: MediaQuery.of(context).size.width *
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
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/image/KNjVEZNv_400x400-removebg-preview.png",
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
              isloading
                  ? Center(
                      child: Lottie.asset("assets/lottie/loading.json",
                          width: 80, height: 80))
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  void forvideo() {
    Random random = Random();
    int rnd = random
        .nextInt(Provider.of<HomeProvider>(context, listen: false).list.length);
    playerController = VideoPlayerController.asset(
        "${Provider.of<HomeProvider>(context, listen: false).list[rnd].video}")
      ..initialize().then(
        (value) {
          setState(
            () {
              playerController.setLooping(true);
              playerController.play();
            },
          );
        },
      );
  }

  Future<bool> dialog() async {
    home_providerf!.playPause();
    playerController.pause();
    back();
    return await false;
  }

  void back() {
    Navigator.pushReplacementNamed(context, '/DashBoard');
  }

  @override
  void dispose() {
    super.dispose();
    dialog();
  }
}
*/
