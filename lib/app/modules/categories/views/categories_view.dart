import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
      child: Scaffold(
        appBar: appBarWithTabWidget(Icon(Icons.arrow_back,color: Colors.black,),"Categories"),
        body: TabBarView(children: [
          Container(height: 812.kh,width: double.infinity,padding: EdgeInsets.fromLTRB(16,16,16,0),color: ColorUtil.allayya_background,
              child: ListView.builder(itemCount: 3,itemBuilder: (context, index){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(onTap: (){
                      Get.toNamed("/track");
                    },child: homeCardWidget("assets/images/home_flower.png")),
                    InkWell(onTap: (){
                      Get.toNamed("/track");
                    },child: homeCardWidget("assets/images/home_image_2.png")),
                  ],
                );
              }),
          ),
          Container(height: 812.kh,width: double.infinity,padding: EdgeInsets.fromLTRB(16,16,16,0),color: ColorUtil.allayya_background,
            child: ListView.builder(itemCount: 3,itemBuilder: (context, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(onTap: (){
                    Get.toNamed("/track");
                  },child: homeCardWidget("assets/images/home_flower.png")),
                  InkWell(onTap: (){
                    Get.toNamed("/track");
                  },child: homeCardWidget("assets/images/home_image_2.png")),
                ],
              );
            }),
          ),
          Container(height: 812.kh,width: double.infinity,padding: EdgeInsets.fromLTRB(16,16,16,0),color: ColorUtil.allayya_background,
            child: ListView.builder(itemCount: 3,itemBuilder: (context, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(onTap: (){
                    Get.toNamed("/track");
                  },child: homeCardWidget("assets/images/home_flower.png")),
                  InkWell(onTap: (){
                    Get.toNamed("/track");
                  },child: homeCardWidget("assets/images/home_image_2.png")),
                ],
              );
            }),
          ),
        ],)
      ),
    );
  }
}
