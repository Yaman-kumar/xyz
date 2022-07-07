import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithoutIconWidget(
        "Notification",
        TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: ColorUtil.kPrimaryBlack),
      ),
      body: Container(
        height: 812.kh,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorUtil.allayya_background,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,8,0,8),
            child: textWidget("Today", TextStyle()),
          ),
          notificationCardWidget(),
          notificationCardWidget(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,8,0,8),
            child: textWidget("This Week", TextStyle()),
          ),
          notificationCardWidget(),
        ]),
      ),
      bottomNavigationBar: bottomNavigationDesign(context),
    );
  }
}
