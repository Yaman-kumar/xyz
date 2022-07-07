import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/services/textstyles.dart';
import 'package:xyz/widget/global_widget.dart';

import '../../pre_sign_up/controllers/pre_sign_up_controller.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
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
              SizedBox(height: 52.kh,),
              SizedBox(
               // height: 240.kh,
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
             //   height: 572.kh,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(0, 115.kh, 0, 0),
                child: Column(
                  children: [
                    textWidget("Create an account to start your",
                        TextStyle(color: ColorUtil.kPrimaryWhite, fontSize: 17.kh)),
                    textWidget("self-care journey",
                        TextStyle(color: ColorUtil.kPrimaryWhite, fontSize: 17.kh)),
                    SizedBox(
                      height: 32.kh,
                    ),
                    SizedBox(
                      width: 343.kw,
                      height: 48.kh,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(0, 0, 0, 0.24),
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(color: Colors.white),
                            contentPadding:  EdgeInsets.only(
                                left: 14.0, bottom: 14.0, top: 8.0),
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
                    SizedBox(
                      height: 6.kh,
                    ),
                    SizedBox(
                        width: 343.kw,
                        child: textWidget(
                            "By creating an account you accept our Terms and Conditions and Privacy Policy",
                            TextStyle(
                                color: ColorUtil.kPrimaryWhite, fontSize: 12))),
                    SizedBox(
                      height: 32.kh,
                    ),
                    buttonWidget(
                        '/login',
                        'Sign Up',
                        ColorUtil.kPrimaryWhite,
                        TextStyle(
                            fontSize: 17.kh,
                            color: ColorUtil.kPrimaryBlack,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 24.kh,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: ColorUtil.kPrimaryWhite,
                      )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5,0,5,0),
                        child: Text(
                          "OR",
                          style: TextStyle(color: ColorUtil.kPrimaryWhite),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: ColorUtil.kPrimaryWhite,
                      )),
                    ]),

                    SizedBox(
                      height: 60.75.kh,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        authenticationLogoWidget("assets/svg/apple_logo.svg"),
                        SizedBox(
                          width: 47.kw,
                        ),
                        authenticationLogoWidget("assets/svg/google_logo.svg"),
                        SizedBox(
                          width: 47.kw,
                        ),
                        authenticationLogoWidget("assets/svg/facebook_logo.svg"),
                      ],
                    ),
                    SizedBox(
                      height: 104.kh,
                    ),
                    richTextWidget(
                      TextStyle(color: ColorUtil.kPrimaryWhite),
                      TextStyle(
                          color: ColorUtil.kPrimaryWhite,
                          fontWeight: FontWeight.bold),
                    ),

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
