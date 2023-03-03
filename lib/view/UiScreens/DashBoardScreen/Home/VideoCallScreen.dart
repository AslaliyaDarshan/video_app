import 'dart:io';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Provider/HomeProvider.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';
import 'package:video_player/video_player.dart';

late VideoPlayerController videoController;

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
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
                  SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: videoController.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: videoController.value.aspectRatio,
                              child: VideoPlayer(videoController))
                          : const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
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
                            imageResolution: ImageResolution.ultraHigh,
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
    Navigator.pushNamed(context, "/DashBoard");
  }
}
// import 'dart:io';
//
// import 'package:face_camera/face_camera.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:video_calling_app/Provider/HomeProvider.dart';
// import 'package:video_player/video_player.dart';

// late VideoPlayerController controller;
//
// class Second_Screen extends StatefulWidget {
//   const Second_Screen({Key? key}) : super(key: key);
//
//   @override
//   State<Second_Screen> createState() => _Second_ScreenState();
// }
//
// class _Second_ScreenState extends State<Second_Screen> {
//   late HomeProvider home_providerf;
//   late HomeProvider home_providert;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.asset(
//         "${Provider.of<HomeProvider>(context, listen: false).model!.video}")
//       ..initialize().then((value) {
//         setState(() {
//           controller.setLooping(true);
//           controller.play();
//         });
//       });
//   }
//
//   File? _capturedImage;
//
//   @override
//   Widget build(BuildContext context) {
//     home_providerf = Provider.of<HomeProvider>(context, listen: false);
//     home_providert = Provider.of<HomeProvider>(context, listen: true);
//     return WillPopScope(
//       onWillPop: dialog,
//       child: SafeArea(
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: Colors.black,
//           body: Builder(
//             builder: (context) {
//               if (_capturedImage != null) {
//                 return Center(
//                   child: Stack(
//                     alignment: Alignment.bottomCenter,
//                     children: [
//                       Image.file(_capturedImage!),
//                     ],
//                   ),
//                 );
//               }
//               return Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height * 1,
//                     width: MediaQuery.of(context).size.width * 0.99,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: controller.value.isInitialized
//                           ? AspectRatio(
//                               aspectRatio: controller.value.aspectRatio,
//                               child: VideoPlayer(controller))
//                           : const Center(
//                               child: CircularProgressIndicator(
//                                 color: Colors.green,
//                               ),
//                             ),
//                     ),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.27,
//                       width: MediaQuery.of(context).size.width * 0.35,
//                       child: SmartFaceCamera(
//                         showCameraLensControl: false,
//                         showFlashControl: false,
//                         showControls: false,
//                         //  autoCapture: true,
//                         defaultCameraLens: CameraLens.front,
//                         onCapture: (File? image) {
//                           _capturedImage = image;
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//           floatingActionButton: Padding(
//             padding: const EdgeInsets.only(bottom: 5),
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.15,
//                 height: MediaQuery.of(context).size.height * 0.15,
//                 child: FloatingActionButton(
//                   onPressed: () {
//                     dialog();
//                   },
//                   child: Icon(
//                     Icons.call,
//                     size: 40,
//                   ),
//                   backgroundColor: Colors.red,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<bool> dialog() async {
//     home_providerf.playPause();
//     controller.pause();
//     back();
//     return await false;
//   }
//
//   void back() {
//     Navigator.pushReplacementNamed(context, '/DashBoard');
//   }
// }
