import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/recommended_controller.dart';

class RecommendedView extends GetView<RecommendedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBarWithIconWidget(Icon(Icons.arrow_back,color: ColorUtil.kPrimaryBlack,), "Recommended"),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorUtil.allayya_background,
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  Icon(Icons.arrow_back,size: 17.kh,),
                    /*Align(
                      alignment: Alignment.center,
                      child: textWidget(
                        'Recommended',
                        TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.kh,
                            color: ColorUtil.kPrimaryBlack),
                      ),
                    ),*/
                    SizedBox(
                      height: 32.kh,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        homeCardWidget("assets/images/home_flower.png"),
                        homeCardWidget("assets/images/home_image_2.png"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        homeCardWidget("assets/images/home_image_3.png"),
                        homeCardWidget("assets/images/home_image_4.png"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        homeCardWidget("assets/images/home_image_5.png"),
                        homeCardWidget("assets/images/home_image_6.png"),
                      ],
                    ),

                  ]),
            )
          ],
        ),
      ),
    );
  }
}
