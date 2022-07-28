import 'package:get/get.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/app/modules/musicplayer/controllers/musicplayer_controller.dart';

import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
    Get.lazyPut<MusicplayerController>(
          () => MusicplayerController(),fenix: true
    );
    Get.lazyPut<HomeController>(
            () => HomeController(),fenix: true
    );

  }
}
