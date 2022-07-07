import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorUtil.allayya_background,
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 99, 16, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                      'Hi there!',
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24.kh),
                    ),
                    SizedBox(
                      height: 12.kh,
                    ),
                    textWidget('What brings you to Allayya?', TextStyle()),
                    SizedBox(
                      height: 34.kh,
                    ),
                   /* Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: PreSignUpController.to.list.map((url) {
                        int index = PreSignUpController.to.list.indexOf(url);
                        return GetBuilder<PreSignUpController>(
                            init: PreSignUpController(),
                            builder: (preSignUpController) {
                              return Container(
                                width: 8.0.kw,
                                height: 8.0.kh,
                                margin: EdgeInsets.symmetric(vertical: 10.0.kh, horizontal: 2.0.kw),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: preSignUpController.currentPos == index
                                      ? ColorUtil.secondary_orange_allayya
                                      : ColorUtil.secondary_grey_1,
                                ),
                              );
                            }
                        );
                      }).toList(),
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        welcomeCircle(Color(0xFFFBEB9C), "assets/svg/lotus.svg",
                            "Meditation",1,100),
                        welcomeCircle(Color(0xFFFDF2E6), "assets/svg/calm.svg",
                            "Sleepsound",2,100),
                        welcomeCircle(Color(0xFF89A5C6),
                            "assets/svg/peaceful.svg", "peaceful",3,100),
                      ],
                    ),
                    SizedBox(
                      height: 24.kh,
                    ),
                    Align(alignment: Alignment.center,
                      child:welcomeCircle(Color(0xFFD4D794), "assets/svg/audio.svg",
                            "Soundscape",4,100),
                    ),
                    SizedBox(
                      height: 104.kh,
                    ),
                    buttonWidget(
                        '/home',
                        'Continue',
                        ColorUtil.secondary_orange_allayya_deactive,
                        TextStyle(
                            fontSize: 17.kh,
                            color: ColorUtil.kPrimaryWhite,
                            fontWeight: FontWeight.bold)),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
