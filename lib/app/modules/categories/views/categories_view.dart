import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/app/modules/track/controllers/track_controller.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController>  {

 // TabController _tabController = new TabController(length: Get.find<HomeController>().userdetails.value.categories!.length,initialIndex: 1, vsync: this);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return DefaultTabController(length: Get.find<HomeController>().userdetails.value.categories!.length,
      child: Scaffold(
        appBar: appBarWithTabWidget(Icon(Icons.arrow_back,color: Colors.black,),"Categories"),
        body: Obx(()=>
          TabBarView(controller:controller.tabController,
            children:
          List.generate(Get.find<HomeController>().userdetails.value.categories!.length, (index) {
            return Container(
              height: 812.kh,width: double.infinity,padding: EdgeInsets.fromLTRB(16,16,16,0),color: ColorUtil.allayya_background,
              child: Obx((){
               // if(controller.fetchsubcatbycatid.value.message==null){
                 return controller.loader.value==true?Center(child: CircularProgressIndicator(color: ColorUtil.secondary_orange_allayya_deactive),)
                     :controller.fetchsubcatbycatid.value.category!.subCategories!.length>0?GridView.count(shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(controller.fetchsubcatbycatid.value.category!.subCategories!.length, (index) {
                      return InkWell(onTap: (){
                      //  Get.find<TrackController>().imageAndNameUpdate((controller.fetchsubcatbycatid.value.category!.subCategories![index]!.coverImage).toString(), (controller.fetchsubcatbycatid.value.category!.subCategories![index]!.name).toString());

                       Get.toNamed("/track");

                      },child: homeCardWidget("${controller.fetchsubcatbycatid.value.category!.subCategories![index]!.coverImage}","${controller.fetchsubcatbycatid.value.category!.subCategories![index]!.numOfTracks}","${controller.fetchsubcatbycatid.value.category!.subCategories![index]!.name}","${controller.fetchsubcatbycatid.value.category!.subCategories![index]!.Id}"));
                    }
                    )
                ):Center(child: Text("No Content available"));//}
                //  return Center(child: CircularProgressIndicator(),);
              }

              ),

            ); }
          ),
           ),
        )
      ),
    );
  }
}
