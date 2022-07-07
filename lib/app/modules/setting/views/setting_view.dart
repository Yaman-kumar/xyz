import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithoutIconWidget(
        "Settings",
        TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: ColorUtil.kPrimaryBlack),
      ),
      body: Container(
        height: 812.kh,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorUtil.allayya_background,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: textWidget("Account", TextStyle()),
          ),

          Container(
            decoration: BoxDecoration(
              color: ColorUtil.kPrimaryWhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                ),
              ],
            ),
            child: Column(children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/home_flower.png"), // no matter how big it is, it won't overflow
                ),
                title: textWidget(
                  "Welcome",
                  TextStyle(),
                ),
                subtitle: textWidget(
                  "Samuel Liza",
                  TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              InkWell(onTap: (){
                Get.toNamed('/profile');
              },
                child: ListTile(
                  leading: Container(
                    height: 36.0,
                    width: 36.0, // fixed width and height

                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color: Color(0xFFFFE4CC),
                    ),
                    child: Center(
                        child: SvgPicture.asset("assets/svg/profile_icon.svg",color: ColorUtil.kPrimaryBlack,)),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,0,8),
                    child: textWidget("Update Account Details", TextStyle(),),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,color: ColorUtil.secondary_orange_allayya,),
                ),
              ),
              Divider(),
              InkWell(onTap: (){
                Get.toNamed('/favorite');
              },
                child: ListTile(
                  leading: Container(
                    height: 36.0,
                    width: 36.0, // fixed width and height

                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color: Color(0xFFFFE4CC),
                    ),
                    child: Center(
                        child: SvgPicture.asset("assets/svg/profile_heart_icon.svg",color: ColorUtil.kPrimaryBlack,)),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,0,8),
                    child: textWidget("Your Favorite List", TextStyle(),),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,color: ColorUtil.secondary_orange_allayya,),
                ),
              ),
            ],),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: textWidget("Support", TextStyle()),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorUtil.kPrimaryWhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                ),
              ],
            ),
            child: Column(children: [
              InkWell(onTap:(){

              },
                child: ListTile(
                  leading: Container(
                    height: 36.0,
                    width: 36.0, // fixed width and height

                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color: Color(0xFFFFE4CC),
                    ),
                    child: Center(
                        child: SvgPicture.asset("assets/svg/term_condition_icon.svg",color: ColorUtil.kPrimaryBlack,)),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,0,8),
                    child: textWidget("Terms & Conditions", TextStyle(),),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,color: ColorUtil.secondary_orange_allayya,),
                ),
              ),
              Divider(),
              ListTile(
                leading: Container(
                  height: 36.0,
                  width: 36.0, // fixed width and height

                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Color(0xFFFFE4CC),
                  ),
                  child: Center(
                      child: SvgPicture.asset("assets/svg/privacy_policies_icon.svg",color: ColorUtil.kPrimaryBlack,)),
                ),
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,0,8),
                  child: textWidget("Privacy Policies", TextStyle(),),
                ),
                trailing: Icon(Icons.arrow_forward_ios,color: ColorUtil.secondary_orange_allayya,),
              ),
            ],),
          ),
        ]),
      ),
      bottomNavigationBar: bottomNavigationDesign(context),
    );
  }
}
