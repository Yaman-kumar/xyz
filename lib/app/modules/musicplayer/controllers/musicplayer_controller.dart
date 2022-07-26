import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/page_manager.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/service_locator.dart';


class MusicplayerController extends GetxController {

  final mediaItems = <MediaItem>[].obs;
  final index = 0.obs;
  final pageManager = getIt<PageManager>();
  final favIconColor=false.obs;


  @override
  Future<void> onInit() async {
    mediaItems.value = Get.arguments[0];
    index.value = Get.arguments[1];
    await  pageManager.loadPlaylist(mediaItems.value,index.value);
    //print("Song Id  ${IDNotifier.value.value}");
   // fromMiniPlayer.value = Get.arguments[0];
   // print(fromMiniPlayer.value);

    //pageManager.loadPlaylist(mediaItems.value, index.value);

    //listenToTotalDuration();
    super.onInit();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}
