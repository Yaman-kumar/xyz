import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xyz/app/modules/musicplayer/views/musicplayer_view.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithoutIconWidget(
        "Discover",
        GoogleFonts.nunito(fontWeight: FontWeight.bold,
            fontSize: 17,
            color: ColorUtil.kPrimaryBlack)

      ),
      body: Container(
        height: 812.kh,
        color: ColorUtil.allayya_background,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Obx(()=>
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 343.kw,
                  height: 48.kh,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(splashColor: Colors.transparent),
                    child: TextField(
                      onChanged:Get.find<DiscoverController>().onSearchChanged,
                      autofocus: false,
                      controller: controller.textEditingController.value,
                      style: GoogleFonts.nunito(color: ColorUtil.kPrimaryBlack)
                      ,
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: InkWell(onTap: (){
                          controller.searchTrackUser();
                        },
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        fillColor: ColorUtil.kPrimaryWhite,
                        hintText: "Search for track",
                        hintStyle: GoogleFonts.nunito(color: Colors.grey),
                        contentPadding:
                            EdgeInsets.only(left: 14.0, bottom: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 0.28)),
                          borderRadius: BorderRadius.circular(10.kh),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 0.28)),
                          borderRadius: BorderRadius.circular(10.kh),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
controller.searchstatus!=0?
                Obx(
                  () {
                    if (controller.searchTrack.value.results != null) {
                      if(controller.searchTrack.value.results!=0) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.searchTrack.value.results,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Obx(
                                        () =>
                                        InkWell(
                                          onTap: () {
                                            // Get.to(MusicplayerView(),arguments: [controller.mediaItems.value,index],opaque: false);
                                          },
                                          child: InkWell(onTap: (){
                                            Get.to(MusicplayerView(),arguments: [controller.mediaItems.value,index],opaque: false);
                                          },
                                            child: ListTile(
                                              leading: SizedBox(
                                                height: 46.0,
                                                width: 42.0,
                                                // fixed width and height
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${controller
                                                              .searchTrack.value
                                                              .tracks![index]!
                                                              .thumbnailImage}"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              title: textWidget(
                                                "${controller.searchTrack.value
                                                    .tracks![index]!.title}",
                                                GoogleFonts.nunito(fontWeight: FontWeight.bold),

                                              ),
                                              subtitle: textWidget(
                                                "${controller.searchTrack.value
                                                    .tracks![index]!.artist}",
                                                GoogleFonts.nunito(color: Color(0xFF818181)),

                                                ),
                                              ),
                                              /* trailing:InkWell(onTap: (){
                                       // controller.addFav(controller.trackList.value.tracks![index]!.Id.toString());
                                      },
                                        child: SvgPicture.asset(
                                            "assets/svg/activefav.svg",
                                        ),
                                      ),*/
                                            ),
                                          ),
                                        ),

                                  Divider(),
                                ],
                              );
                            });
                      }
                      else{
                        return Center(child: Text("No Tracks Found",style: GoogleFonts.nunito(),),);
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(color: ColorUtil.secondary_orange_allayya_deactive,),
                    );
                  },
                ):Container(),
                /*  SizedBox(height:24.kh ,),
                textWidget("Based on your previous search", TextStyle(fontWeight: FontWeight.bold,fontSize: 17.kh),),
                ListTile(leading: SvgPicture.asset("assets/svg/history_icon.svg"),title: Text("Quite Rain in River"),trailing: Text("X"),),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWidget(
                        'Recommended',
                        TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.kh,
                            color: ColorUtil.kPrimaryBlack),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/recommended');
                        },
                        child: textWidget(
                          'See All',
                          TextStyle(
                              fontSize: 12.kh,
                              color: ColorUtil.kPrimaryBlack),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 16.kh,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homeCardWidget("assets/images/home_flower.png"),
                    homeCardWidget("assets/images/home_image_2.png"),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationDesign(context),
    );
  }
}


