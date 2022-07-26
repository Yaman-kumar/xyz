import 'package:get/get.dart';
import 'package:xyz/app/modules/sign_up/controllers/sign_up_controller.dart';

import '../controllers/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
   /* Get.lazyPut<SignUpController>(
            () => SignUpController(),fenix:true
    );*/
  }
}
