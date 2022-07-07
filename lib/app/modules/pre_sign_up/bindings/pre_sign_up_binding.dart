import 'package:get/get.dart';

import '../controllers/pre_sign_up_controller.dart';

class PreSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreSignUpController>(
      () => PreSignUpController(),
    );
  }
}
