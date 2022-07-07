import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithoutIconWidget(
        "Discover",
        TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: ColorUtil.kPrimaryBlack),
      ),
      body: Container(
        height: 812.kh,
        color: ColorUtil.allayya_background,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 343.kw,
                height: 48.kh,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    autofocus: false,

                    style: TextStyle(color: ColorUtil.kPrimaryBlack),
                    decoration: InputDecoration(
                      filled: true,suffixIcon: Icon(Icons.search,color: Colors.grey,),
                      fillColor: ColorUtil.kPrimaryWhite,
                      hintText: "Search for track",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:  EdgeInsets.only(
                          left: 14.0, bottom: 14.0, top: 14.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 0.28)),
                        borderRadius: BorderRadius.circular(10.kh),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 0.28)),
                        borderRadius: BorderRadius.circular(10.kh),
                      ),
                    ),
                  ),

                ),
              ),
            /*  SizedBox(height:24.kh ,),
              textWidget("Based on your previous search", TextStyle(fontWeight: FontWeight.bold,fontSize: 17.kh),),
              ListTile(leading: SvgPicture.asset("assets/svg/history_icon.svg"),title: Text("Quite Rain in River"),trailing: Text("X"),),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textWidget(
                      'Recommended',
                      TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.kh,
                          color: ColorUtil.kPrimaryBlack),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/recommended');
                      },
                      child: textWidget(
                        'See All',
                        TextStyle(
                            fontSize: 12.kh,
                            color: ColorUtil.kPrimaryBlack),
                      ),
                    ),
                  ]),
              SizedBox(
                height: 16.kh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  homeCardWidget("assets/images/home_flower.png"),
                  homeCardWidget("assets/images/home_image_2.png"),
                ],
              ),*/

            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationDesign(context),
    );
  }
}
