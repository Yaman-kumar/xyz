import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/app/modules/profile/model/image_response_model.dart';
import 'package:xyz/services/apicall.dart';
import 'package:xyz/services/storage.dart';
class ProfileController extends GetxController {
  //TODO: Implement ProfileController

static ProfileController get to => Get.find();
var pickedImage=File("").obs;
final textEditingControllerMobile=TextEditingController().obs;
final textEditingControllerName=TextEditingController().obs;
final textEditingControllerEmail=TextEditingController().obs;
final profilestatus=0.obs;
final imageUpload=ImageUpload().obs;
  @override
  void onInit() {
    super.onInit();
    textEditingControllerMobile.value.text=(Get.find<HomeController>().userDatainfo.value.user!.phone).toString();
    textEditingControllerName.value.text=(Get.find<HomeController>().userDatainfo.value.user!.name).toString();
    textEditingControllerEmail.value.text=(Get.find<HomeController>().userDatainfo.value.user!.email).toString();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> pickImage() async {
    profilestatus.value=1;
    print("file return ::: ${pickedImage.value.path}");
    final ImagePicker picker = ImagePicker();

    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      print("image path ${pickedImage.value.path}");
      pickedImage.value=File(image!.path);
      print("pickedImage path ${pickedImage.value.path}");
    }catch(e){
      throw Exception(e);
    }
  }
Rx<bool> updateProfileLoade=false.obs;
  Future<void> profileImageUpload() async {
    updateProfileLoade.value=true;
    String userId=await Get.find<GetStorageService>().getUserId;
    if(!(pickedImage.value.path.isEmpty)){
      var response = await ApiCall().uploadImage(pickedImage.value.path);
      imageUpload.value=ImageUpload.fromJson(response);
      print("response ${"${imageUpload.value.url}"}");


      var body={
        "image":imageUpload.value.url.toString(),
        "name" :textEditingControllerName.value.text.toString(),
        "phone":textEditingControllerMobile.value.text.toString(),
        "email":textEditingControllerEmail.value.text.toString()
      };

      await ApiCall().patchDataWithHeaderandBody("/api/user/${userId}",jsonEncode(body));
      Get.find<HomeController>().fetchUserData();
      Get.snackbar("Message", "Profile updated Sucessfully");

    }
    else{

      var body={
        "name" :textEditingControllerName.value.text.toString(),
        "phone":textEditingControllerMobile.value.text.toString(),
        "email":textEditingControllerEmail.value.text.toString()
      };
      await ApiCall().patchDataWithHeaderandBody("/api/user/${userId}",jsonEncode(body));
      Get.find<HomeController>().fetchUserData();
      Get.snackbar("Message", "Profile updated Sucessfully");
    }
    updateProfileLoade.value=false;
  }


}
