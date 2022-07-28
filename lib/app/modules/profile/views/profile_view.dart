import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/service_locator.dart';
import 'package:xyz/app/routes/app_pages.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/services/storage.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: ColorUtil.kPrimaryBlack,
            )),
        backgroundColor: ColorUtil.allayya_background,
        title: Text(
          "Update Account Details",
          style: GoogleFonts.nunito(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Obx(()=>
             InkWell(
                onTap: () {
                  controller.profileImageUpload();
                },
                child:controller.updateProfileLoade.value==false? Container(
                  margin: EdgeInsets.all(14),
                  padding: EdgeInsets.all(7),
                  height: 32.kh,
                  width: 32.kh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xFFF89E53),
                  ),
                  child: SvgPicture.asset("assets/svg/check.svg"),
                ):Center(child:progressBAr())),
          )
        ],
      ),
      body: Container(
        height: 812.kh,
        width: double.infinity,
        color: ColorUtil.allayya_background,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 172,
              width: 172,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 172,
                      width: 172,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorUtil.kPrimaryWhite),
                      child: Obx(() {
                        if (((Get.find<HomeController>()
                                        .userDatainfo
                                        .value
                                        .user!
                                        .image) !=
                                    null ||
                                (Get.find<HomeController>()
                                        .userDatainfo
                                        .value
                                        .user!
                                        .image) !=
                                    "") &&
                            controller.profilestatus.value == 0) {
                          return CircleAvatar(
                            backgroundColor: ColorUtil.allayya_background,
                            backgroundImage: NetworkImage(
                                (Get.find<HomeController>()
                                        .userDatainfo
                                        .value
                                        .user!
                                        .image)
                                    .toString()),
                          );
                        } else {
                          return CircleAvatar(
                              backgroundColor: ColorUtil.allayya_background,
                              backgroundImage:
                                  FileImage(controller.pickedImage.value));
                        }
                      }),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 15,
                    child: InkWell(
                      onTap: () {
                        controller.pickImage();
                      },
                      child: Container(
                        height: 36.kw,
                        width: 36.kw,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorUtil.kPrimaryWhite),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/svg/edit_icon.svg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.kh,
            ),
            SizedBox(
              width: 343.kw,
              height: 48.kh,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: controller.textEditingControllerMobile.value,
                enabled: controller.textEditingControllerMobile.value.text ==""?false:true,

                // obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 14.0, bottom: 14.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text(
                    "Mobile Number",
                    style:GoogleFonts.nunito(color: Colors.grey) ,
                  ),
                  hintText: 'Enter Number',hintStyle: GoogleFonts.nunito()
                ),
              ),
            ),
            SizedBox(
              height: 31.kh,
            ),
            SizedBox(
              width: 343.kw,
              height: 48.kh,
              child: TextField(
                controller: controller.textEditingControllerName.value,
                   //obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 14.0, bottom: 14.0, top: 8.0),
                  /* suffixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Edit",
                      style: TextStyle(color: ColorUtil.secondary_orange_allayya),
                    ),
                  ),*/
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text(
                    "Name",
                    style: GoogleFonts.nunito(color: Colors.grey)
                    ,
                  ),
                  hintText: 'Enter Name',hintStyle: GoogleFonts.nunito()
                ),
              ),
            ),
            SizedBox(
              height: 31.kh,
            ),
            SizedBox(
              width: 343.kw,
              height: 48.kh,
              child: TextField(
                controller: controller.textEditingControllerEmail.value,
                enabled: controller.textEditingControllerEmail.value.text ==""?false:true,
                //obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 14.0, bottom: 14.0, top: 8.0),
                  /*suffixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Edit",
                      style: TextStyle(color: ColorUtil.secondary_orange_allayya),
                    ),
                  ),*/
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text(
                    "Email",
                    style: GoogleFonts.nunito(color: Colors.grey) ,
                  ),
                  hintText: 'Enter Email',hintStyle: GoogleFonts.nunito()
                ),
              ),
            ),
            SizedBox(
              height: 110.kh,
            ),
            SizedBox(
              width: 343.kw,
              height: 48.kh,
              child: ElevatedButton(
                onPressed: () {
                  Get.find<GetStorageService>().setisLoggedIn=false;
                  getIt<AudioHandler>().stop();
                  Get.offAllNamed(Routes.SIGN_UP);
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    shadowColor: MaterialStateProperty.all(
                        ColorUtil.secondary_orange_allayya),
                    backgroundColor:
                        MaterialStateProperty.all(ColorUtil.allayya_background),
                    // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0.kh),
                            side: BorderSide(
                                color: ColorUtil.secondary_orange_allayya)))),
                child: Text(
                  "Logout",
                  style: GoogleFonts.nunito(color: ColorUtil.kPrimaryBlack,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
