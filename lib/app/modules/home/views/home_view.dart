import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(appBar: appBarWithoutIconWidget('Good Morning, Samuel', TextStyle(color: Color(0xFF818181),fontWeight: FontWeight.bold,fontSize:24.kh )),
        body: Container(
          height: 812.kh,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorUtil.allayya_background,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 812.kh,
                  width: 375.kw,
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24.kh,
                        ),
                        textWidget(
                            'Categories',
                            TextStyle(
                              color: ColorUtil.kPrimaryBlack,
                              fontSize: 17.kh,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 34.kh,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 100.kh,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              welcomeCircleSmall(Color(0xFFFBEB9C),
                                  "assets/svg/lotus.svg", "Meditation", 1, 56),
                             SizedBox(height: 17.kw,),
                              welcomeCircleSmall(Color(0xFFFDF2E6),
                                  "assets/svg/brain.svg", "   Focus   ", 2, 56),
                              SizedBox(height: 17.kw,),
                              welcomeCircleSmall(
                                Color(0xFF89A5C6),
                                "assets/svg/peaceful.svg",
                                "peaceful",
                                3,
                                56,
                              ),
                              SizedBox(height: 17.kw,),
                              welcomeCircleSmall(Color(0xFFD4D794),
                                  "assets/svg/audio.svg", "Soundscape", 4, 56),
                              SizedBox(height: 17.kw,),
                              welcomeCircleSmall(Color(0xFFFDF2E6),
                                  "assets/svg/calm.svg", "Sleepsound", 5, 56),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.kh,
                        ),
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
                        SizedBox(
                          height: 169.kh,
                         // width: 164.kw,
                          child: ListView(scrollDirection: Axis.horizontal,
                            children: [
                              homeCardWidget("assets/images/home_flower.png"),
                              homeCardWidget("assets/images/home_image_2.png"),
                              homeCardWidget("assets/images/home_flower.png"),
                          ],),
                        ),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            homeCardWidget("assets/images/home_flower.png"),
                            homeCardWidget("assets/images/home_image_2.png"),
                          ],
                        ),*/
                        SizedBox(
                          height: 32.kh,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textWidget(
                                'Favorites',
                                TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.kh,
                                    color: ColorUtil.kPrimaryBlack),
                              ),
                              InkWell(onTap: (){
                                Get.toNamed('/favorite');

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
                        SizedBox(
                          width: double.infinity,
                          height: 95.kw,
                          child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(onTap: (){

                                },child: homeFavoriteCardWidget());
                              }),
                        ),
                      ]),
                )
              ],
            ),
          ),

        ),
        bottomNavigationBar: bottomNavigationDesign(context),
      ),
    );
  }
}
