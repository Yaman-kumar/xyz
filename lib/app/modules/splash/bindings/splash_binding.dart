import 'package:get/get.dart';
import 'package:xyz/app/modules/categories/controllers/categories_controller.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/app/modules/musicplayer/controllers/musicplayer_controller.dart';
import 'package:xyz/app/modules/player_ui/controllers/player_ui_controller.dart';
import 'package:xyz/app/modules/profile/controllers/profile_controller.dart';
import 'package:xyz/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:xyz/app/modules/welcome/controllers/welcome_controller.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );

    Get.lazyPut<SignUpController>(
          () => SignUpController(),fenix:true
    );

    Get.lazyPut<WelcomeController>(
            () => WelcomeController(),fenix:true
    );

    Get.lazyPut<CategoriesController>(
            () => CategoriesController(),fenix:true
    );

    Get.lazyPut<PlayerUiController>(
            () => PlayerUiController(),fenix:true
    );

    Get.lazyPut<ProfileController>(
          () => ProfileController(),fenix:true
    );
    Get.lazyPut<MusicplayerController>(
            () => MusicplayerController(),fenix: true
    );

    Get.lazyPut<SignUpController>(
          () => SignUpController(),fenix:true
    );

    Get.lazyPut<HomeController>(
            () => HomeController(),fenix:true
    );
  }
}
