import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xyz/app/modules/home/views/home_view.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      body: Center(
          child: Image(width: double.infinity,
        image: AssetImage(
          "assets/splash/splash_image.png",
        ),
        fit: BoxFit.cover,
      )),
    );
  }
}
