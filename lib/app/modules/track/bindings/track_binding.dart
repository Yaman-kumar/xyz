import 'package:get/get.dart';
import 'package:xyz/app/modules/musicplayer/controllers/musicplayer_controller.dart';

import '../controllers/track_controller.dart';

class TrackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackController>(
      () => TrackController(),
    );
    Get.lazyPut<MusicplayerController>(
          () => MusicplayerController(),fenix: true
    );
  }
}
