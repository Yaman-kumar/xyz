import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xyz/app/routes/app_pages.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
  Get.put(HomeController());

    return Scaffold(
      appBar: appBarWithoutIconWidget(
          '${controller.GREETING()}',
          GoogleFonts.nunito(color: Color(0xFF818181),
              fontWeight: FontWeight.bold,
              fontSize: 24.kh)),

      body: Container(
        height: 812.kh,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorUtil.allayya_background,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 812.kh,
                width: 375.kw,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.kh,
                      ),
                      textWidget(
                          'Categories',
                          GoogleFonts.nunito( color: ColorUtil.kPrimaryBlack,
                            fontSize: 17.kh,
                            fontWeight: FontWeight.bold,),
                          ),
                      SizedBox(
                        height: 16.kh,
                      ),
                      Container(

                          width: double.infinity,
                          height: 100.kh,
                          child: Obx(
                            () =>controller.loadercategories==false? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.categoriesListLength.value,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: welcomeCircleSmall(
                                        Color(0xFFFBEB9C),
                                        "${controller.userdetails.value.categories?[index]!.coverImage}",
                                        "${controller.userdetails.value.categories?[index]!.name}",
                                        index + 1,
                                        56),
                                  );
                                }):Center(child: progressBAr()),
                          )),
                      SizedBox(height: 20.kh,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          //
                            textWidget(
                              'Recommended',
                              GoogleFonts.nunito(fontWeight: FontWeight.bold,
                                  fontSize: 17.kh,
                                  color: ColorUtil.kPrimaryBlack)
                            ,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.RECOMMENDED);
                              },
                              child: textWidget(
                                'See All',
                                GoogleFonts.nunito( fontSize: 12.kh,
                                    color: ColorUtil.kPrimaryBlack)
                                ,
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 16.kh,
                      ),
                      Obx(() {
                        return controller.loader.value != true
                        &&
                                controller.recommendedData.value
                                        .recommSubCategories?.length !=
                                    0
                            ? Container(height: 190.kh,
                              child: ListView.builder(shrinkWrap: true,
                                  itemCount: controller.recommendedDataLength.value<3?controller.recommendedDataLength.value:3,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return homeCardWidget(
                                        "${controller.recommendedData.value.recommSubCategories?[index]!.coverImage}",
                                        "${controller.recommendedData.value.recommSubCategories?[index]!.numOfTracks}",
                                        "${controller.recommendedData.value.recommSubCategories?[index]!.name}","${controller.recommendedData.value.recommSubCategories?[index]!.Id}");
                                  }),
                            )
                            : Center(
                                child: controller.loader.value != true &&
                                        controller
                                                .recommendedData
                                                .value
                                                .recommSubCategories?.length == 0
                                    ? Center(
                                        child: Text(
                                            "No Recommended Data available",style: GoogleFonts.nunito(),),
                                      )
                                    : CircularProgressIndicator(color: ColorUtil.secondary_orange_allayya_deactive,),
                              );
                      }),
                      SizedBox(
                        height: 20.kh,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget(
                              'Favourites',
                              GoogleFonts.nunito( fontWeight: FontWeight.bold,
                                  fontSize: 17.kh,
                                  color: ColorUtil.kPrimaryBlack),

                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.FAVORITE);
                               // controller.fetchFaviorateData();
                              },
                              child: textWidget(
                                'See All',
                                GoogleFonts.nunito(fontSize: 12.kh,
                                    color: ColorUtil.kPrimaryBlack),

                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 16.kh,
                      ),
                      Container(
                        width: double.infinity,
                        height: 110.kw,

                        child: Obx(() {
                          return controller.loaderfav.value==true?
                          Center(child: progressBAr()):
                          controller.favListemp.value==false?ListView.builder(
                              itemCount: controller.favListLength.value<3?controller.favListLength.value:3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {},
                                    child: homeFavoriteCardWidget(
                                        (controller.userfav.value
                                            .favoriteTracks!
                                            .tracks?[index]!
                                            .thumbnailImage).toString(),
                                        (controller.userfav.value
                                            .favoriteTracks!
                                            .tracks?[index]!
                                            .title).toString(),
                                        (controller.userfav.value
                                            .favoriteTracks!
                                            .tracks?[index]!
                                            .desc).toString()));
                              }):Center(child: Text("No favourites added",style: GoogleFonts.nunito(),),);
                           /*if() {
                             return ListView.builder(
                                 itemCount: controller.favListLength.value<3?controller.favListLength.value:3,
                                 scrollDirection: Axis.horizontal,
                                 itemBuilder: (context, index) {
                                   return InkWell(
                                       onTap: () {},
                                       child: homeFavoriteCardWidget(
                                           (controller.userfav.value
                                               .favoriteTracks!
                                               .tracks?[index]!
                                               .thumbnailImage).toString(),
                                           (controller.userfav.value
                                               .favoriteTracks!
                                               .tracks?[index]!
                                               .title).toString(),
                                           (controller.userfav.value
                                               .favoriteTracks!
                                               .tracks?[index]!
                                               .desc).toString()));
                                 });
                           }
                           else{
                             return Center(child: Text("No favourites added"),);
                           }*/

                        }
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationDesign(context),
    );
  }
}
