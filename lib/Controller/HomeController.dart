import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:video_calling_app/model/VideoModel.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  static HomeController homeController = Get.put(HomeController());
  late VideoPlayerController videoController;
  RxBool mBlnSelect = true.obs;
  RxBool mBlnSelect1 = false.obs;
  RxBool mBlnSelect2 = false.obs;
  RxBool mBlnSelect3 = false.obs;
  RxBool mBlnIsPlay = false.obs;
  RxBool pBlnIsLoading = false.obs;
  RxBool loading1 = false.obs;

  var date = DateTime.now();
  VideoModel? model;
  RxInt index = 0.obs;

  String mStrName = "";
  late String mStrFileName = "";

  late StreamSubscription subscription;
  RxBool isDeviceConnected = false.obs;
  RxBool isAlertSet = false.obs;

  changeIndex(int i) {
    index.value = i;
    update();
  }

  void playPause() {
    mBlnIsPlay.value = !mBlnIsPlay.value;
    update();
  }

  getData(dynamic data_1) {
    date = data_1;
  }

  List<VideoModel> list = [
    VideoModel(
        name: "Akshi",
        image: "assets/videoImage/p30.png",
        video: "assets/video/30.mp4"),
    VideoModel(
        name: "Kiara",
        image: "assets/videoImage/p49.png",
        video: "assets/video/49.mp4"),
    VideoModel(
        name: "Khushi",
        image: "assets/videoImage/i14.jpg",
        video: "assets/video/14.mp4"),
    VideoModel(
        name: "Mia",
        image: "assets/videoImage/i4.jpg",
        video: "assets/video/4.mp4"),
    VideoModel(
        name: "Eva",
        image: "assets/videoImage/i5.jpg",
        video: "assets/video/5.mp4"),
    VideoModel(
        name: "Lilly",
        image: "assets/videoImage/i6.jpg",
        video: "assets/video/6.mp4"),
    VideoModel(
        name: "Nancy",
        image: "assets/videoImage/i8.jpg",
        video: "assets/video/8.mp4"),
    VideoModel(
        name: "Elisa",
        image: "assets/videoImage/i9.jpg",
        video: "assets/video/9.mp4"),
    VideoModel(
        name: "Kyra",
        image: "assets/videoImage/i10.jpg",
        video: "assets/video/10.mp4"),
    VideoModel(
        name: "Kavya",
        image: "assets/videoImage/i11.jpg",
        video: "assets/video/11.mp4"),
    VideoModel(
        name: "Siya",
        image: "assets/videoImage/i11.jpg",
        video: "assets/video/12.mp4"),
    VideoModel(
        name: "Meher",
        image: "assets/videoImage/i12.jpg",
        video: "assets/video/13.mp4"),
    VideoModel(
        name: "Leena",
        image: "assets/videoImage/i2.jpg",
        video: "assets/video/2.mp4"),
    VideoModel(
        name: "Vaira",
        image: "assets/videoImage/i15.jpg",
        video: "assets/video/15.mp4"),
    VideoModel(
        name: " Ananya",
        image: "assets/videoImage/p32.png",
        video: "assets/video/32.mp4"),
    VideoModel(
        name: "Shreya",
        image: "assets/videoImage/i16.jpg",
        video: "assets/video/16.mp4"),
    VideoModel(
        name: "Krisha",
        image: "assets/videoImage/i17.jpg",
        video: "assets/video/17.mp4"),
    VideoModel(
        name: "Henu",
        image: "assets/videoImage/i18.jpg",
        video: "assets/video/18.mp4"),
    VideoModel(
        name: "Aalia",
        image: "assets/videoImage/i19.jpg",
        video: "assets/video/19.mp4"),
    VideoModel(
        name: "Angel",
        image: "assets/videoImage/i20.jpg",
        video: "assets/video/20.mp4"),
    VideoModel(
        name: "Pari",
        image: "assets/videoImage/i21.jpg",
        video: "assets/video/21.mp4"),
    VideoModel(
        name: "Urvi",
        image: "assets/videoImage/i22.jpg",
        video: "assets/video/22.mp4"),
    VideoModel(
        name: "Krupa",
        image: "assets/videoImage/i23.jpg",
        video: "assets/video/23.mp4"),
    VideoModel(
        name: "Ishya",
        image: "assets/videoImage/i24.jpg",
        video: "assets/video/24.mp4"),
    VideoModel(
        name: "Sneha",
        image: "assets/videoImage/i1.jpg",
        video: "assets/video/1.mp4"),
    VideoModel(
        name: "Hiya",
        image: "assets/videoImage/i25.jpg",
        video: "assets/video/25.mp4"),
    VideoModel(
        name: "Disha",
        image: "assets/videoImage/i26.jpg",
        video: "assets/video/26.mp4"),
    VideoModel(
        name: "Chhavi",
        image: "assets/videoImage/i27.jpg",
        video: "assets/video/27.mp4"),
    VideoModel(
        name: "Bansi",
        image: "assets/videoImage/p28.png",
        video: "assets/video/28.mp4"),
    VideoModel(
        name: "Shruti",
        image: "assets/videoImage/p29.png",
        video: "assets/video/29.mp4"),
    VideoModel(
        name: "Lara",
        image: "assets/videoImage/i3.jpg",
        video: "assets/video/3.mp4"),
    VideoModel(
        name: "Akshi",
        image: "assets/videoImage/p30.png",
        video: "assets/video/30.mp4"),
    VideoModel(
        name: "Anu",
        image: "assets/videoImage/p31.png",
        video: "assets/video/31.mp4"),
    VideoModel(
        name: "Mary",
        image: "assets/videoImage/p33.png",
        video: "assets/video/33.mp4"),
    VideoModel(
        name: "Laura",
        image: "assets/videoImage/i7.jpg",
        video: "assets/video/7.mp4"),
    VideoModel(
        name: "Naina",
        image: "assets/videoImage/p34.png",
        video: "assets/video/34.mp4"),
    VideoModel(
        name: "Janki",
        image: "assets/videoImage/p35.png",
        video: "assets/video/35.mp4"),
    VideoModel(
        name: "Nyla",
        image: "assets/videoImage/p36.png",
        video: "assets/video/36.mp4"),
    VideoModel(
        name: "Vaani",
        image: "assets/videoImage/p37.png",
        video: "assets/video/37.mp4"),
    VideoModel(
        name: "Ria",
        image: "assets/videoImage/p38.png",
        video: "assets/video/38.mp4"),
    VideoModel(
        name: "Jiya",
        image: "assets/videoImage/p39.png",
        video: "assets/video/39.mp4"),
    VideoModel(
        name: "Tanvi",
        image: "assets/videoImage/p40.png",
        video: "assets/video/40.mp4"),
    VideoModel(
        name: "Ishani",
        image: "assets/videoImage/p41.png",
        video: "assets/video/41.mp4"),
    VideoModel(
        name: "Prisha",
        image: "assets/videoImage/p42.png",
        video: "assets/video/42.mp4"),
    VideoModel(
        name: "Priya",
        image: "assets/videoImage/p43.png",
        video: "assets/video/43.mp4"),
    VideoModel(
        name: "Anadi",
        image: "assets/videoImage/p44.png",
        video: "assets/video/44.mp4"),
    VideoModel(
        name: "Anu",
        image: "assets/videoImage/p45.png",
        video: "assets/video/45.mp4"),
    VideoModel(
        name: "Nora",
        image: "assets/videoImage/p46.png",
        video: "assets/video/46.mp4"),
    VideoModel(
        name: "Aadhi",
        image: "assets/videoImage/p47.png",
        video: "assets/video/47.mp4"),
    VideoModel(
        name: "Ridhi",
        image: "assets/videoImage/p48.png",
        video: "assets/video/48.mp4"),
    VideoModel(
        name: "Radii",
        image: "assets/videoImage/p50.png",
        video: "assets/video/50.mp4"),
    VideoModel(
        name: "Maya",
        image: "assets/videoImage/p51.png",
        video: "assets/video/51.mp4"),
    VideoModel(
        name: "Sarah",
        image: "assets/videoImage/p52.png",
        video: "assets/video/52.mp4"),
    VideoModel(
        name: "Krupa",
        image: "assets/videoImage/i23.jpg",
        video: "assets/video/23.mp4"),
  ];
}
