import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/service_locator.dart';
import 'package:xyz/app/modules/splash/bindings/splash_binding.dart';
import 'package:xyz/services/storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Get.put(GetStorageService()).initState();
  await setupServiceLocator();
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
