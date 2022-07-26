import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xyz/app/modules/pre_sign_up/controllers/pre_sign_up_controller.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/services/textstyles.dart';
import 'package:xyz/widget/global_widget.dart';



class PreSignUpView extends GetView<PreSignUpController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         height: 813.kh,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/signup_signin/background.png"),
              fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 296.kh,
                width: 112.kh,
                child: Container(
                  height: 86.kh,
                  width: 112.kh,
                  child: Image(
                      image: AssetImage("assets/images/allayya_logo.png"),
                      ),
                ),
              ),
              Container(
                height: 517.kh,
                width: double.infinity,
               padding: EdgeInsets.fromLTRB(0,261.kh,0,0),
                child: Column(
                  children: [
                    Text("It’s you-time",style: TextStyleUtil.textMontserratStyleS14W400CDark_orangeAllayya(),),

                    Container(height: 38.kh,width: double.infinity,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: true,
                              onPageChanged: (index, reason) {

                                PreSignUpController.to.updateDots(index);

                              }
                          ),
                          items: PreSignUpController.to.list
                              .map((item) => Container(
                            child: Center(child: Text(item.toString(),textAlign: TextAlign.center,)),
                           // color: Colors.green,
                          ))
                              .toList(),
                        )),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: PreSignUpController.to.list.map((url) {
                        int index = PreSignUpController.to.list.indexOf(url);
                        return Obx(() =>
                           Container(
                            width: 8.0.kw,
                            height: 8.0.kh,
                            margin: EdgeInsets.symmetric(vertical: 10.0.kh, horizontal: 2.0.kw),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.currentPos.value == index
                                  ? ColorUtil.secondary_orange_allayya
                                  : ColorUtil.secondary_grey_1,
                            ),
                          ),
                        );

                      }).toList(),
                    ),
                    SizedBox(height: 20.kh,),
                    buttonWidget('/sign-up','Get Started',ColorUtil.secondary_orange_allayya,TextStyle(fontSize: 17.kh,color: ColorUtil.kPrimaryWhite)),
                   /* SizedBox(height: 20.kh,),
                    richTextWidget(TextStyle(),TextStyle(color: ColorUtil.kPrimaryBlack,
                        fontWeight: FontWeight.bold),),*/

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
