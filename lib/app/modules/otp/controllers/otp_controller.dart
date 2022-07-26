import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController
final textControllerOne=TextEditingController().obs;
final textControllerTwo=TextEditingController().obs;
final textControllerThree=TextEditingController().obs;
final textControllerFour=TextEditingController().obs;
final textControllerFive=TextEditingController().obs;
final textControllerSix=TextEditingController().obs;


  final count = 0.obs;
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
