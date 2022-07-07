import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/player_ui_controller.dart';

class PlayerUiView extends GetView<PlayerUiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812.kh,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/music_player_background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 52.kh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(onTap: (){
                  Get.back();
                },
                  child: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: ColorUtil.kPrimaryWhite,
                  ),
                ),
                Text(
                  "Nature",
                  style: TextStyle(
                      color: ColorUtil.kPrimaryWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.kh),
                ),
                Icon(
                  Icons.share,
                  color: ColorUtil.kPrimaryWhite,
                ),
              ],
            ),
            SizedBox(
              height: 44.kh,
            ),
            textWidget(
              "Quite Rain in River",
              TextStyle(
                  color: ColorUtil.kPrimaryWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.kh),
            ),
            SizedBox(
              height: 6.kh,
            ),
            textWidget(
              "Stereo Outdoor Sampling",
              TextStyle(
                  color: ColorUtil.kPrimaryWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.kh),
            ),
            SizedBox(height: 455.kh,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Container(height:40 ,width: 40,
              decoration: BoxDecoration(
                color:Color.fromRGBO(0, 0, 0, 0.28),
                shape: BoxShape.circle,
              ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/music_icon1.svg",
                  ),
                ),
              ),
              Container(height:40 ,width: 40,
                decoration: BoxDecoration(
                  color:Color.fromRGBO(0, 0, 0, 0.28),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/music_icon2.svg",
                  ),
                ),
              ),
              Container(height:64 ,width: 64,
                decoration: BoxDecoration(
                  //color: ColorUtil.kPrimaryWhite,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/play_button.svg",
                  ),
                ),
              ),
              Container(height:40 ,width: 40,
                decoration: BoxDecoration(
                  color:Color.fromRGBO(0, 0, 0, 0.28),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/music_icon3.svg",
                  ),
                ),
              ),
              Container(height:40 ,width: 40,
                decoration: BoxDecoration(
                  color:Color.fromRGBO(0, 0, 0, 0.28),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/music_icon4.svg",
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
