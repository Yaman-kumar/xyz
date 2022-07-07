import 'package:get/get.dart';
import 'package:xyz/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  Rx<int> active=0.obs;

  void checkActiveIndex(index){
    active=index;
  }

  @override
  void onInit() {
    super.onInit();
    print("splash");
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 5), () async{
      // Get.offAllNamed(Routes.ONBOARDING);
      Get.offAllNamed(Routes.PRE_SIGN_UP);

    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
