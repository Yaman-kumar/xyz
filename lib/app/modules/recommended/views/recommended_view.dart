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
    return Scaffold(backgroundColor: ColorUtil.allayya_background,
      appBar: appBarWithIconWidget(Icon(Icons.arrow_back,color: ColorUtil.kPrimaryBlack,), "Recommended"),
      body: Obx(() {
        return
        Column(
          children: [
            Expanded(
              child: GridView.count(
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
              ),
            ),
          ],
        );
      }
      ),
    );
  }
}
