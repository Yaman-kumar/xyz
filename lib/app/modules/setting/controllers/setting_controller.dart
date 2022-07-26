import 'package:get/get.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController

  final count = 0.obs;
  @override
  void onInit() {
    Get.find<HomeController>().fetchUserData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
