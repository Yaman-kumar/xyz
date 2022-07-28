import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xyz/app/data/categories.dart';
import 'package:xyz/app/modules/home/model/user_data.dart';
import 'package:xyz/app/modules/home/model/user_favorites.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/page_manager.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/service_locator.dart';
import 'package:xyz/app/modules/recommended/model/recomendeddatafromapi.dart';
import 'package:xyz/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:xyz/services/apicall.dart';
import 'package:xyz/services/storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  static HomeController get to => Get.find();
  var userfav = UserFavorites().obs;
  var userDatainfo = UserData().obs;
  var userdetails = userDeteails().obs;
  var recommendedData = RecomendedData().obs;
  var selectedCategoriesIndex = 0.obs;
  final count = 0.obs;
  SignUpController signUpController = Get.find<SignUpController>();
  final FirebaseAuth Aauth = FirebaseAuth.instance;
  Rx<bool> loader = false.obs;
  Rx<bool> loaderfav = false.obs;

  @override
  onInit()  {
    super.onInit();
    getIt<PageManager>().init();
    final User? user =  Aauth.currentUser;
    user == null ?print("Null") : signUpController.validateCreatetoken(user);
    fetchUserData();
    fetchCategoriesData();
    fetchRecommendedData();
    fetchFaviorateData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void selectedCategories(int index) {
    selectedCategoriesIndex.value = index;
  }

  TabController? _tabController;
  var categoriesListLength = 0.obs;
  Rx<bool> loadercategories = false.obs;

  fetchCategoriesData() async {
    loadercategories.value = true;
    var response = await ApiCall().fetchDataWithoutHeader('/api/category');
    userdetails.value = userDeteails.fromJson(response);
    categoriesListLength.value = userdetails.value.categories!.length;
    loadercategories.value = false;
  }

  var recommendedDataLength = 0.obs;

  fetchRecommendedData() async {
    loader.value = true;
    var response = await ApiCall()
        .fetchDataWithHeader('/api/sub-category/recommended/tracks');
    recommendedData.value = RecomendedData.fromJson(response);
    recommendedDataLength.value =
        recommendedData.value.recommSubCategories!.length;
    loader.value = false;
  }

  var favListLength = 0.obs;
  var favListemp = false.obs;

   fetchFaviorateData() async {
   String userId=  Get.find<GetStorageService>().getUserId;
    print("Get.find<GetStorageService>().getUserId :${Get.find<GetStorageService>().getUserId}");
    loaderfav.value = true;
    var response = await ApiCall().fetchDataWithoutHeader(
        '/api/favorites/${userId}');
    userfav.value = UserFavorites.fromJson(response);
    favListLength.value = userfav.value.favoriteTracks!.tracks!.length;
    favListemp.value = userfav.value.favoriteTracks!.tracks!.isEmpty;
    loaderfav.value = false;
  }

  fetchUserData() async {
    var response = await ApiCall().postDataWithoutbody('/api/user/login');
    userDatainfo.value = UserData.fromJson(response);
    Get.find<GetStorageService>().setUserId =
        userDatainfo.value.user!.Id.toString();
    print("User id ::: ${Get.find<GetStorageService>().getUserId}");
  }

  String GREETING() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour < 12)
      return "Good Morning";
    else if (hour < 17)
      return "Good Afternoon";
    else
      return "Good Evening";
  }
}
