import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xyz/app/modules/categories/controllers/categories_controller.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/MiniPlayer.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/notifiers/play_button_notifier.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/page_manager.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/service_locator.dart';
import 'package:xyz/app/modules/musicplayer/views/musicplayer_view.dart';
import 'package:xyz/app/modules/player_ui/controllers/player_ui_controller.dart';
import 'package:xyz/app/routes/app_pages.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/track_controller.dart';

class TrackView extends GetView<TrackController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: ColorUtil.allayya_background,
          height: 812.kh,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: ColorUtil.kPrimaryBlack,
                    ),
                  ),
                  textWidget("Nature", GoogleFonts.nunito(fontWeight: FontWeight.bold)
                      ),
                  Text(""),
                ],
              ),
              Container(
                height: 210.kh,
                width: double.infinity,
                color: ColorUtil.kPrimaryWhite,
                child: CachedNetworkImage(
                  placeholder: (context, url) => Center(child: progressBAr()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.fill,
                  imageUrl: (Get.find<CategoriesController>().imageSelectedCategories).toString(),
                  imageBuilder: (context, imageProvider) {
                    // you can access to imageProvider
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(height:  210.kh,

                          decoration: BoxDecoration(image:DecorationImage(image: imageProvider,fit: BoxFit.cover) ),)
                    );
                  },
                ),


              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 630.kh,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorUtil.kPrimaryWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => textWidget(
                              "${controller.trackList.value.results == null ? 0 : controller.trackList.value.results} Tracks",
                             GoogleFonts.nunito(fontWeight: FontWeight.bold,fontSize: 17) ),
                        ),
                        SizedBox(
                          height: 560.kh,
                          width: double.infinity,
                          child: Obx(
                            () {
                              if (controller.loader.value==false) {
                                return controller.trackList.value.tracks!.length>0? ListView.builder(
                                      itemCount:
                                          controller.trackList.value.results,
                                      itemBuilder: (context, index) {


                                        return Column(
                                          children: [
                                             InkWell(
                                                onTap: () {

                                                  Get.to(MusicplayerView(),arguments: [controller.mediaItems.value,index],opaque: false);
                                                },

                                                child: Obx(()=>
                                                    ListTile(
                                                      leading: Transform.translate(offset: Offset(-16, 0),
                                                        child: SizedBox(
                                                          height: 42.0,
                                                          width: 46.32,
                                                          // fixed width and height
                                                          child: CachedNetworkImage(
                                                            placeholder: (context, url) => Center(child: progressBAr()),
                                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                                            fit: BoxFit.fill,
                                                            imageUrl: (controller.trackList.value.tracks![index]!.thumbnailImage).toString(),
                                                            imageBuilder: (context, imageProvider) {
                                                              // you can access to imageProvider
                                                              return ClipRRect(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  child: Container(

                                                                    decoration: BoxDecoration(image:DecorationImage(image: imageProvider,fit: BoxFit.cover) ),)
                                                              );


                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      title: Transform.translate(offset:Offset(-16, 0) ,
                                                        child: textWidget(
                                                          "${controller.trackList.value.tracks![index]!.title}",
                                                          GoogleFonts.nunito(fontWeight: FontWeight.bold)
                                                          ,
                                                        ),
                                                      ),
                                                      subtitle: Transform.translate(offset:Offset(-16, 0),
                                                        child: textWidget(
                                                          "${controller.trackList.value.tracks![index]!.artist}",
                                                          GoogleFonts.nunito(color: Color(0xFF818181)),

                                                        ),
                                                      ),
                                                      trailing:controller.trackList.value.tracks![index]!.isFavourite==false?
                                                      InkWell(onTap: (){

                                                        // controller.activeInactiveFav(true);
                                                        // controller.favStatus.value=true;
                                                        controller.addFav(controller.trackList.value.tracks![index]!.Id.toString());

                                                        Get.find<HomeController>().fetchCategoriesData();
                                                        // controller.fetchTrackData();
                                                      },
                                                        child: SvgPicture.asset(
                                                          "assets/svg/heart_inactive.svg",
                                                        ),
                                                      ):
                                                      InkWell(onTap: (){
                                                        // controller.activeInactiveFav(false);
                                                        controller.removeFav(controller.trackList.value.tracks![index]!.Id.toString());

                                                        Get.find<HomeController>().fetchCategoriesData();
                                                        //controller.fetchTrackData();
                                                      },
                                                        child: SvgPicture.asset(
                                                          "assets/svg/activefav.svg",
                                                        ),
                                                      ),

                                                    ),
                                                ),
                                              ),

                                            Divider(),
                                          ],
                                        );
                                      }):Center(child: Text("No content available",style: GoogleFonts.nunito(),));
                              }
                              else {
                                return Center(child: progressBAr());
                              }
                              // return controller.trackList.value.tracks!=null? Center(
                              //   child: CircularProgressIndicator(color: ColorUtil.secondary_orange_allayya_deactive,),
                              // ):Center(child: Text("No content available"),);
                            },
                          ),
                        ),
                      ]),
                ),
              ),
              Container( height: 193.kh,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                   
                    colors: [
                      Color.fromRGBO(32, 32, 32, 0.54),
                      Color.fromRGBO(27, 27, 27, 0),
                    ],
                  )
              ),),
              Padding(
                padding: EdgeInsets.fromLTRB(16.kh, 52.kh, 16.kh, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(height: 37,width: 37,child:Icon(
                        Icons.arrow_back,
                        color: ColorUtil.kPrimaryBlack,
                      ),decoration: BoxDecoration(color: Colors.white.withOpacity(0.7),borderRadius: BorderRadius.all(Radius.circular(8))),)
                     /* Icon(
                        Icons.arrow_back,
                        color: ColorUtil.kPrimaryBlack,
                      ),*/
                    ),
                    textWidget(
                        (Get.find<CategoriesController>().nameSelectedCategories).toString(),
                        GoogleFonts.nunito( fontWeight: FontWeight.bold,
                            color: ColorUtil.kPrimaryWhite,
                            fontSize: 17.kh)),

                    Text(""),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0.88, -0.6),
                child: Material(elevation:5 ,borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: InkWell(onTap: (){
                    Get.to(MusicplayerView(),arguments: [controller.mediaItems.value,0],opaque: false);
                  },
                    child: Container(
                      height: 56.kw,
                      width: 56.kw,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF89E53)),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svg/play_icon.svg",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              Align(alignment: Alignment.bottomCenter,child: StreamBuilder<AudioProcessingState>(
                  stream: getIt<AudioHandler>().playbackState.map((state) => state.processingState).distinct(),
                  builder:
                    (context,snapshot) {
                      final playing = snapshot.data ?? AudioProcessingState.idle;
                  return playing == AudioProcessingState.ready ?small_player(status: false,):SizedBox(height: 1,width: 0,);
                }
              )),

              // Align(alignment: Alignment.bottomCenter,child: ValueListenableBuilder<ButtonState>(
              //     valueListenable:getIt<PageManager>().playButtonNotifier,
              //     builder: (_, title, __) {
              //       return ButtonState.playing == true ?small_player(status: false,):SizedBox(height: 1,width: double.infinity,);
              //     }
              // )),

            ],
          )),
    );
  }
}
