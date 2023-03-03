import 'dart:io';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_calling_app/view/UiScreens/DashBoardScreen/DashBoardScreen.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';
import 'package:video_player/video_player.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  // HomeController controller = Get.put(HomeController());
  late VideoPlayerController videoController;
  HomeProvider? hpt;
  HomeProvider? hpf;

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.asset(
        "${Provider.of<HomeProvider>(context, listen: false).model!.video}")
      ..initialize().then(
        (value) {
          setState(() {
            videoController.setLooping(true);
            videoController.play();
          });
        },
      );
  }

  File? _capturedImage;

  @override
  Widget build(BuildContext context) {
    hpt = Provider.of<HomeProvider>(context, listen: true);
    hpf = Provider.of<HomeProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: dialog,
      child: Scaffold(
        body: GlobalWidget.backgroundColor(
          Builder(
            builder: (context) {
              if (_capturedImage != null) {
                return Center(
                  child: Image.file(_capturedImage!),
                );
              }
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  videoController.value.isInitialized
                      ? SizedBox(
                          height: 100.h,
                          width: 100.w,
                          child: AspectRatio(
                            aspectRatio: videoController.value.aspectRatio,
                            child: VideoPlayer(videoController),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.27,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: SmartFaceCamera(
                            showCameraLensControl: false,
                            showFlashControl: false,
                            showControls: false,
                            defaultCameraLens: CameraLens.front,
                            onCapture: (File? image) {
                              _capturedImage = image;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: SizedBox(
            width: 8.5.h,
            height: 8.5.h,
            child: FloatingActionButton(
              onPressed: () {
                // dialog();
                Provider.of<HomeProvider>(context, listen: false).playPause();
                videoController.pause();
                Navigator.pushNamed(context, "/DashBoard");
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.call,
                size: 40,
                color: Colors.pink.shade400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> dialog() async {
    Provider.of<HomeProvider>(context, listen: false).playPause();
    videoController.pause();
    back();
    return false;
  }

  back() {
    // Navigator.of(context, rootNavigator: true).pop();
    Navigator.pushNamed(context, "/DashBoard");
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const DashBoardScreen(),
    //   ),
    // );
  }
}
