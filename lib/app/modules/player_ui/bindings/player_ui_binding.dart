import 'package:get/get.dart';

import '../controllers/player_ui_controller.dart';

class PlayerUiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerUiController>(
      () => PlayerUiController(),
    );
  }
}
