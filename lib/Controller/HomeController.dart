import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController homeController = Get.put(HomeController());
  RxBool mBlnSelect = true.obs;
  RxBool mBlnSelect1 = false.obs;
  RxBool mBlnSelect2 = false.obs;
  RxBool mBlnSelect3 = false.obs;
  var date = DateTime.now();
  getData(dynamic data_1) {
    date = data_1;
  }

}
