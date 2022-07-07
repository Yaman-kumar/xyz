import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xyz/app/modules/otp/widget/otp_box.dart';
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
              fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
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
                    textWidget("+1 - 1244 4444 444",
                        TextStyle(color: ColorUtil.kPrimaryWhite, fontSize: 14.kh)),
                    SizedBox(
                      height: 32.kh,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      otpBoxWidget(context),
                      otpBoxWidget(context),
                      otpBoxWidget(context),
                      otpBoxWidget(context),
                      otpBoxWidget(context),
                      otpBoxWidget(context),
                    ],),

                     SizedBox(
                      height: 48.kh,
                    ),
                    buttonWidget(
                        '/welcome',
                        'Submit',
                        ColorUtil.kPrimaryWhite,
                        TextStyle(
                            fontSize: 17.kh,
                            color: ColorUtil.kPrimaryBlack,
                            fontWeight: FontWeight.bold)),

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
