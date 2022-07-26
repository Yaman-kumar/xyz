import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/page_manager.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/service_locator.dart';
import 'package:xyz/app/modules/sign_up/controllers/sign_up_controller.dart';

class PreSignUpController extends GetxController {
  //TODO: Implement PreSignUpController
  static PreSignUpController get to => Get.find();

  List<String> list=[" Add small moments of self-care and \nself-love to your day ","  Add small moments of self-care and \nself-love to your day","   Add small moments of self-care and \nself-love to your day"];

  final count = 0.obs;
  var currentPos = 0.obs;
  final xyz= "".obs;


  void updateDots(index) {


    currentPos.value = index;

  }


  @override
  void onInit() {

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
