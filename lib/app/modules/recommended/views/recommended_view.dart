import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
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

                    SizedBox(
                      height: 32.kh,
                    ),

                    Obx(() {
                      return
                      GridView.count(shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 8.0,
                          children: List.generate(Get
                              .find<HomeController>()
                              .recommendedData
                              .value
                              .recommSubCategories!
                              .length, (index) {
                            return InkWell(onTap: () {
                              Get.toNamed("/track");
                            }, child: homeCardWidget("${Get
                                .find<HomeController>()
                                .recommendedData
                                .value
                                .recommSubCategories?[index]?.coverImage}",
                                "${Get
                                    .find<HomeController>()
                                    .recommendedData
                                    .value
                                    .recommSubCategories?[index]?.numOfTracks}",
                                "${Get
                                    .find<HomeController>()
                                    .recommendedData
                                    .value
                                    .recommSubCategories?[index]?.name}","${Get
                                    .find<HomeController>()
                                    .recommendedData
                                    .value
                                    .recommSubCategories?[index]?.Id}"));
                          }
                          )
                      );
                    }
                    ),

                  ]),
            )
          ],
        ),
      ),
    );
  }
}
