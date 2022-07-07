import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xyz/app/modules/splash/bindings/splash_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {

        return GetMaterialApp(debugShowCheckedModeBanner: false,
          //initialBinding: SplashBinding(),
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      }
    ),
  );
}
