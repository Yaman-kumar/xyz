import 'dart:convert';

import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';
import 'package:xyz/app/data/trackListmodel.dart';
import 'package:xyz/app/modules/categories/controllers/categories_controller.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/services/apicall.dart';
import 'package:xyz/services/storage.dart';

class TrackController extends GetxController {
  //TODO: Implement TrackController
  static TrackController get to => Get.find();
  final mediaItems = <MediaItem>[].obs;
  var trackList = TrackList().obs;
  var subCategoriesId = "".obs;
  var favStatus = false.obs;
  final trackPageImage = "".obs;
  final trackPageName = "".obs;
  final count = 0.obs;
  Rx<bool> loader = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTrackData();
    //addFavDataToPlay();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void activeInactiveFav(val) {
    favStatus.value = val;
  }

  void imageAndNameUpdate(String image, String name) {
    trackPageImage.value = image;
    trackPageName.value = name;
  }

  void subCatId(id) {
    subCategoriesId.value = id;
  }

  fevIndex(int index) {
    fetchTrackData();
  }

   fetchTrackData() async {
     mediaItems.clear();
    loader.value = true;
    var response = await ApiCall().fetchDataWithoutHeader(
        '/api/tracks?subCategoryId=${Get.find<CategoriesController>().subCategoriesId.value}&userId=${Get.find<GetStorageService>().getUserId}');
    trackList.value = TrackList.fromJson(response);
    if (trackList.value.tracks!.length > 0) {
      for (int i = 0; i < trackList.value.tracks!.length; i++) {
        mediaItems.add(
          MediaItem(
              id: '${trackList.value.tracks?[i]?.Id}',
              album: '${trackList.value.tracks?[i]?.title}',
              title: '${trackList.value.tracks?[i]?.title}',
              artUri: trackList.value.tracks?[i]?.thumbnailImage == null
                  ? Uri.parse("${trackList.value.tracks?[i]?.thumbnailImage}")
                  : Uri.parse("${trackList.value.tracks?[i]?.thumbnailImage}"),
              artist: '${trackList.value.tracks?[i]?.artist}',
              extras: {
                'url': '${trackList.value.tracks?[i]?.audioTrack}',
                'isFav':'${trackList.value.tracks?[i]?.isFavourite}'
              }),
        );
      }

    }
     loader.value = false;
  }

  Future<void> addFav(String trackId) async {
    var body = jsonEncode({"trackAction": "add", "trackId": trackId});
    var response =
        await ApiCall().postDataWithHeaderandBody('/api/favorites', body);
    fetchTrackData();
  }

  Future<void> removeFav(String trackId) async {
    var body = jsonEncode({"trackAction": "remove", "trackId": trackId});
    var response =
        await ApiCall().postDataWithHeaderandBody('/api/favorites', body);
    fetchTrackData();
  }

  Future<void> getFav() async {
    //  var response = await ApiCall().postDataWithHeaderandBody('/api/favorites/');
  }
}
