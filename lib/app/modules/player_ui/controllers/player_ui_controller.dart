import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';

class PlayerUiController extends GetxController {
  //TODO: Implement PlayerUiController

  static PlayerUiController get to => Get.find();
  final player = AudioPlayer().obs;                   // Create a player
  var duration;
  final count = 0.obs;
  var trackUrl = "".obs;
  @override
  Future<void> onInit() async {
    super.onInit();
     duration = await player.value.setUrl(           // Load a URL
        'https://allayya-tracks.s3.us-west-1.amazonaws.com/ethereal-meditation-airy-and-tranquil-110249.mp3');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

 void playTrack(String track){
    trackUrl.value = track;
  }
}
