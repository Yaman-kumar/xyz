import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xyz/app/modules/categories/model/subcategoriesdatausingcatid.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/services/apicall.dart';

class CategoriesController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement CategoriesController
  static CategoriesController get to => Get.find();
  TabController? tabController;
  var fetchsubcatbycatid=fetchSubCategoriesByUsingCategoriesId().obs;
  var imageSelectedCategories="";
  var nameSelectedCategories="";
  var subCategoriesId="".obs;

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = new TabController(length: Get.find<HomeController>().userdetails.value.categories!.length,initialIndex: Get.find<HomeController>().selectedCategoriesIndex.value, vsync: this);
    tabController!.addListener(_handleTabSelection);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController!.dispose();
  }
  void increment() => count.value++;
  Rx<bool> loader=false.obs;

  void getSubCategoiesId(String id){
    subCategoriesId.value=id;
  }

  _handleTabSelection() async {
loader.value=true;
    Get.find<HomeController>().selectedCategories(tabController!.index);
    await Get.find<CategoriesController>().fetchSubCaCategoriesData();
    print("Tab Changes Listein");
    loader.value=false;
    //fetchsubcatbycatid.value=fetchSubCategoriesByUsingCategoriesId();
  }
  Future<void> fetchSubCaCategoriesData() async {

    var response = await ApiCall().fetchDataWithoutHeader('/api/category/${Get.find<HomeController>().userdetails.value.categories?[Get.find<HomeController>().selectedCategoriesIndex.value]!.Id}');
    fetchsubcatbycatid.value=fetchSubCategoriesByUsingCategoriesId.fromJson(response);
  }




}
