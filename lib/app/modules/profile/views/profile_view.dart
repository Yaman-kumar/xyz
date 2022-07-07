import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithIconWidget(
          Icon(
            Icons.arrow_back,
            color: ColorUtil.kPrimaryBlack,
          ),
          "Update Account Details"),
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
                          shape: BoxShape.circle, color: ColorUtil.kPrimaryWhite),
                      child: CircleAvatar(backgroundColor: ColorUtil.allayya_background,
                        backgroundImage: AssetImage(
                            "assets/images/profile_icon.png"), // no matter how big it is, it won't overflow
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 15,
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
                ],
              ),
            ),
            SizedBox(height: 40.kh,),
            SizedBox(
              width: 343.kw,
              height: 48.kh,
              child: TextField(
               // obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text(
                    "Mobile Number",
                    style: TextStyle(color: Colors.grey),
                  ),
                  hintText: 'Enter Number',
                ),
              ),
            ),
            SizedBox(height: 31.kh,),
            SizedBox(
              width: 343.kw,
              height: 48.kh,
              child: TextField(
                //obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 14.0, bottom: 14.0, top: 8.0),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Edit",
                      style: TextStyle(color: ColorUtil.secondary_orange_allayya),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text(
                    "Name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  hintText: 'Enter Name',
                ),
              ),
            ),
            SizedBox(height: 31.kh,),
            SizedBox(
              width: 343.kw,
              height: 48.kh,
              child: TextField(
                //obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.only(left: 14.0, bottom: 14.0, top: 8.0),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Edit",
                      style: TextStyle(color: ColorUtil.secondary_orange_allayya),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text(
                    "Email",
                    style: TextStyle(color: Colors.grey),
                  ),
                  hintText: 'Enter Email',
                ),
              ),
            ),
        SizedBox(height: 110.kh,),
        SizedBox(width: 343.kw,height: 48.kh,
          child:
              ElevatedButton(
                onPressed: () {
                 // Get.toNamed(event);
                },
                style: ButtonStyle(elevation:MaterialStateProperty.all(0.0),shadowColor:MaterialStateProperty.all(ColorUtil.secondary_orange_allayya) ,
                    backgroundColor:MaterialStateProperty.all(ColorUtil.allayya_background),
                    // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0.kh),
                          side: BorderSide(color: ColorUtil.secondary_orange_allayya)
                        )
                    )
                ),

                child: Text("Logout",style: TextStyle(color: ColorUtil.kPrimaryBlack,fontWeight: FontWeight.bold),),
              ),

        ),
          ]),
        ),
      ),
    );
  }
}
