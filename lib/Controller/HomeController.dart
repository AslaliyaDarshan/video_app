import 'package:get/get.dart';
import 'package:video_calling_app/model/VideoModel.dart';

class HomeController extends GetxController {
  static HomeController homeController = Get.put(HomeController());
  RxBool mBlnSelect = true.obs;
  RxBool mBlnSelect1 = false.obs;
  RxBool mBlnSelect2 = false.obs;
  RxBool mBlnSelect3 = false.obs;
  var date = DateTime.now();
  VideoModel? model;
  RxBool mBlnIsPlay = false.obs;
  RxInt index = 0.obs;
  changeIndex(int i){
    index.value = i;
  }

  void playPause() {
    mBlnIsPlay.value = !mBlnIsPlay.value;
  }

  getData(dynamic data_1) {
    date = data_1;
  }

  List<VideoModel> list = [
    VideoModel(
        name: "Sneha",
        image: "assets/videoImage/43.jpg",
        video: "assets/video/v11.mp4"),
    VideoModel(
        name: "Leena",
        image: "assets/videoImage/44.jpg",
        video: "assets/video/v12.mp4"),
    VideoModel(
        name: "Lara",
        image: "assets/videoImage/45.jpg",
        video: "assets/video/v13.mp4"),
    VideoModel(
        name: "Mia",
        image: "assets/videoImage/46.jpg",
        video: "assets/video/v14.mp4"),
    VideoModel(
        name: "Eva",
        image: "assets/videoImage/47.jpg",
        video: "assets/video/v15.mp4"),
    VideoModel(
        name: "Lilly",
        image: "assets/videoImage/48.jpg",
        video: "assets/video/v16.mp4"),
    VideoModel(
        name: "Laura",
        image: "assets/videoImage/49.jpg",
        video: "assets/video/v17.mp4"),
    VideoModel(
        name: "Nancy",
        image: "assets/videoImage/50.jpg",
        video: "assets/video/v18.mp4"),
    VideoModel(
        name: "Elisa",
        image: "assets/videoImage/51.jpg",
        video: "assets/video/v19.mp4"),
    VideoModel(
        name: "Siya",
        image: "assets/videoImage/52.jpg",
        video: "assets/video/v20.mp4"),
  ];
}
