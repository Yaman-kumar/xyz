import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xyz/app/modules/discover/model/search_track.dart';
import 'package:xyz/services/apicall.dart';

class DiscoverController extends GetxController {
  //TODO: Implement DiscoverController
  static DiscoverController get to => Get.find();
  var searchTrack = SearchTrack().obs;
  final textEditingController=TextEditingController().obs;
  final searchstatus=0.obs;
  final mediaItems = <MediaItem>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _debounce?.cancel();
  }
  Rx<bool> loader = false.obs;

  Future<void> searchTrackUser() async {
    searchstatus.value=1;
    loader.value = true;
    var response = await ApiCall()
        .fetchDataWithoutHeader('/api/tracks?search=${textEditingController.value.text}&resultFor=user');
    searchTrack.value = SearchTrack.fromJson(response);
    //searchstatus.value=0;
    for(int i=0;i<searchTrack.value.tracks!.length;i++){
      mediaItems.add( MediaItem(
          id: '${searchTrack.value.tracks?[i]?.Id}',
          album: '${searchTrack.value.tracks?[i]?.title}',
          title: '${searchTrack.value.tracks?[i]?.title}',
          artUri:   searchTrack.value.tracks?[i]?.thumbnailImage == null ? Uri.parse("${searchTrack.value.tracks?[i]?.thumbnailImage}") :Uri.parse("${searchTrack.value.tracks?[i]?.thumbnailImage}"),
          artist: '${searchTrack.value.tracks?[i]?.artist}',
          extras: {
            'url': '${searchTrack.value.tracks?[i]?.audioTrack}'
            ,
          }
      ),
      );
    }
    loader.value = false;

  }
  Timer? _debounce;
  onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchTrackUser();
    });
  }

}
