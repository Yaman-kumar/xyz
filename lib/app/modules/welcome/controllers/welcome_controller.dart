import 'package:get/get.dart';

class WelcomeController extends GetxController {
  //TODO: Implement WelcomeController
  static WelcomeController get to => Get.find();
  List<String> list=["Meditation","Sleepsound","peaceful","Soundscape"];
  List<int> selectedList=[];
  final count = 0.obs;
  var activeValue=0.obs;
 void updateActiveWelcome(index){
   if(!selectedList.contains(index)){
     selectedList.add(index);
   }
   activeValue.value=index;
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
