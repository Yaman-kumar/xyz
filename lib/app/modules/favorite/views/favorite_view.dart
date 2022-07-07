import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFFFDF2E6),
          height: 812.kh,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: ColorUtil.kPrimaryBlack,
                  ),
                  textWidget("Nature", TextStyle(fontWeight: FontWeight.bold)),
                  Text(""),
                ],
              ),
              Container(
                height: 210.kh,
                width: double.infinity,
                color: Color(0xFFFDF2E6),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 630.kh,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorUtil.kPrimaryWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(
                            "7 Tracks", TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 560.kh,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      leading: SizedBox(
                                        height: 46.0,
                                        width: 42.0, // fixed width and height
                                        child: Image.asset(
                                          "assets/images/list_item_1.png",
                                        ),
                                      ),
                                      title: textWidget(
                                        "When It Rain It Pours",
                                        TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: textWidget(
                                        "Mestizo",
                                        TextStyle(
                                          color: Color(0xFF818181),
                                        ),
                                      ),
                                      trailing: SvgPicture.asset(
                                        "assets/svg/heart_inactive.svg",
                                      ),

                                    ),
                                    Divider(),
                                  ],
                                );
                              }),
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 52, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(onTap: (){
                      Get.back();
                    },
                      child: Icon(
                        Icons.arrow_back,
                        color: ColorUtil.kPrimaryBlack,
                      ),
                    ),
                    textWidget(
                        "Your Favorite",
                        TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorUtil.kPrimaryBlack,
                            fontSize: 17.kh)),
                    Text(""),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0.88, -0.6),
                child: Container(
                  height: 56.kw,
                  width: 56.kw,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorUtil.secondary_orange_allayya),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/svg/play_icon.svg",
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
