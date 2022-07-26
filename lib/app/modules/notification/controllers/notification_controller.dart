import 'package:get/get.dart';
import 'package:xyz/app/modules/notification/model/notification_model.dart';
import 'package:xyz/services/apicall.dart';
import 'package:xyz/services/storage.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  static NotificationController get to => Get.find();
  var userNotifivation= UserNotification().obs;
  @override
  void onInit() {
    super.onInit();
    GetAllNotification();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
Rx<bool> loader=false.obs;
  Future<void> GetAllNotification() async {
    loader.value=true;
    var response = await ApiCall().fetchDataWithoutHeader('/api/notifications');
    userNotifivation.value=UserNotification.fromJson(response);
    loader.value=false;
  }

}
