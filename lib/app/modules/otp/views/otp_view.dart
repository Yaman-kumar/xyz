import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xyz/app/modules/otp/widget/otp_box.dart';
import 'package:xyz/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 813.kh,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/signup_signin/rectangle_blur.png"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              height: 813.kh,
              width: double.infinity,
              /* decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/signup_signin/rectangle_blur.png"),
                    fit: BoxFit.cover),
              ),*/
            ),
            Container(
               height: 813.kh,
              width: double.infinity,
             /* decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/signup_signin/rectangle_blur.png"),
                    fit: BoxFit.fill),
              ),*/
              child: SingleChildScrollView(
                child: Obx(()=>
                   Column(
                    children: [
                      SizedBox(height: 58,),
                      SizedBox(
                      //  height: 229.kh,
                        width: 72.86.kw,
                        child: Container(
                          height: 94.kh,
                          width: 72.86.kw,
                          child: Image(
                            image: AssetImage("assets/images/allayya_logo.png"),
                          ),
                        ),
                      ),
                      Container(
                       // height: 584.kh,
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(16, 104.kh, 16, 0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            textWidget("Enter Code",
                                TextStyle(color: ColorUtil.kPrimaryWhite, fontSize: 24.kh,fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,6,6,6.0),
                              child: textWidget("Please enter the code that we shared on",
                                  TextStyle(color: ColorUtil.kPrimaryWhite, fontSize: 14.kh)),
                            ),
                            textWidget(Get.find<SignUpController>().textEditingController.value.text,
                                TextStyle(color: ColorUtil.kPrimaryWhite, fontSize: 14.kh)),
                            SizedBox(
                              height: 32.kh,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              otpBoxWidget(context,Get.find<OtpController>().textControllerOne.value),
                              otpBoxWidget(context,Get.find<OtpController>().textControllerTwo.value),
                              otpBoxWidget(context,Get.find<OtpController>().textControllerThree.value),
                              otpBoxWidget(context,Get.find<OtpController>().textControllerFour.value),
                              otpBoxWidget(context,Get.find<OtpController>().textControllerFive.value),
                              otpBoxWidget(context,Get.find<OtpController>().textControllerSix.value),
                            ],),

                             SizedBox(
                              height: 48.kh,
                            ),
                            Get.find<SignUpController>().loaderOtp.value==false?
                            buttonWidget(
                                '/welcome',
                                'Submit',
                                ColorUtil.kPrimaryWhite,
                                TextStyle(
                                    fontSize: 17.kh,
                                    color: ColorUtil.kPrimaryBlack,
                                    fontWeight: FontWeight.bold)):Center(child: progressBAr()),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
