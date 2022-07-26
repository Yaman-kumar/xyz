import 'dart:convert';

import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/app/modules/home/model/user_favorites.dart';
import 'package:xyz/services/apicall.dart';
import 'package:xyz/services/storage.dart';

class FavoriteController extends GetxController {
  //TODO: Implement FavoriteController

  static FavoriteController get to => Get.find();
  final mediaItems = <MediaItem>[].obs;
  Rx<bool> loader=false.obs;

  @override
  void onInit() {
    super.onInit();
    addFavDataToPlay();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> addFavDataToPlay() async {
loader.value=true;
    var response = await ApiCall().fetchDataWithoutHeader('/api/favorites/${Get.find<GetStorageService>().getUserId}');
    Get.find<HomeController>().userfav.value=UserFavorites.fromJson(response);
    for(int i=0;i<Get.find<HomeController>().userfav.value.results!.toInt();i++){
      mediaItems.add( MediaItem(
          id: '${Get.find<HomeController>().userfav.value.favoriteTracks?.tracks?[i]?.Id}',
          album: '${Get.find<HomeController>().userfav.value.favoriteTracks?.tracks?[i]?.title}',
          title: '${Get.find<HomeController>().userfav.value.favoriteTracks?.tracks?[i]?.title}',
          artUri:   Get.find<HomeController>().userfav.value.favoriteTracks?.tracks?[i]?.thumbnailImage == null ? Uri.parse("${Get.find<HomeController>().userfav.value.favoriteTracks?.tracks?[i]?.thumbnailImage}") :Uri.parse("${Get.find<HomeController>().userfav.value.favoriteTracks?.tracks?[i]?.thumbnailImage}"),
          artist: '${Get.find<HomeController>().userfav.value.favoriteTracks?.tracks?[i]?.artist}',
          extras: {
            'url': '${Get.find<HomeController>().userfav.value.favoriteTracks?.tracks?[i]?.audioTrack}'
            ,
          }
      ),
      );
    }
    loader.value=false;
  }

  Future<void> removeFav(String trackId) async {
    var body=jsonEncode({
      "trackAction": "remove",
      "trackId": trackId
    });
    var response = await ApiCall().postDataWithHeaderandBody('/api/favorites',body);
  }

}
