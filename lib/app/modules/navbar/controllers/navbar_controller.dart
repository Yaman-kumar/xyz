import 'package:get/get.dart';

class NavbarController extends GetxController {
  //TODO: Implement NavbarController

  final count = 0.obs;
  final pageIndex=1.obs;

  void pageIndexValue(index){
    pageIndex.value=index;
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
