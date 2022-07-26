import 'package:get/get.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/page_manager.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/service_locator.dart';
import 'package:xyz/app/routes/app_pages.dart';
import 'package:xyz/services/storage.dart';

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
    onPageLoad();
    getIt<PageManager>().init();
  }

  @override
  void onReady() {
    super.onReady();

  }

  onPageLoad()async{
    await Future.delayed(Duration(seconds: 3), () async{
      // Get.offAllNamed(Routes.ONBOARDING);
      if(Get.find<GetStorageService>().getisLoggedIn){
        Get.offAllNamed(Routes.HOME);
      }
      else
        Get.offAllNamed(Routes.PRE_SIGN_UP);

    });
  }
  @override
  void onClose() {}
  void increment() => count.value++;
}
