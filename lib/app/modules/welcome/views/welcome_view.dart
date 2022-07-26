import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(WelcomeController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorUtil.allayya_background,
        ),
        child: SingleChildScrollView(
          child: Obx(()=>
             Column(
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
                        GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 8.0,
                            children: List.generate(
                                controller.categoriesLength.value,
                                (index) {
                              return welcomeCircle(
                                  Color(0xFFFBEB9C),
                                  "${controller.userdetails.value.categories?[index]!.coverImage}",
                                  "${controller.userdetails.value.categories?[index]!.name}",
                                  index + 1,
                                  90);
                            })),
                        SizedBox(
                          height: 104.kh,
                        ),
                       controller.loader.value==false? buttonWidget(
                            '/home',
                            'Continue',
                            ColorUtil.secondary_orange_allayya_deactive,
                            TextStyle(
                                fontSize: 17.kh,
                                color: ColorUtil.kPrimaryWhite,
                                fontWeight: FontWeight.bold)):Center(child: progressBAr()),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
