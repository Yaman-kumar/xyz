import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/MiniPlayer.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/service_locator.dart';
import 'package:xyz/app/modules/musicplayer/views/musicplayer_view.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/widget/global_widget.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
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
                  textWidget("Nature", TextStyle(fontWeight: FontWeight.bold)),
                  Text(""),
                ],
              ),
              Container(
                height: 210.kh,
                width: double.infinity,
                color: Color(0xFFFDF2E6)

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
                              "${Get.find<HomeController>().userfav.value.results == null ? 7 : Get.find<HomeController>().userfav.value.results} Tracks",
                              TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                        ),
                        SizedBox(
                          height: 560.kh,
                          width: double.infinity,
                          child: Obx(
                                () {
                              if (controller.loader == false) {
                                if((Get.find<HomeController>().userfav.value.results!)>0) {
                                  return ListView.builder(
                                      itemCount:
                                      Get
                                          .find<HomeController>()
                                          .userfav
                                          .value
                                          .results,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Obx(
                                                  () =>
                                                  InkWell(
                                                    onTap: () {
                                                      /*Get.find<PlayerUiController>()
                                                    .playTrack(controller
                                                        .trackList
                                                        .value
                                                        .tracks![index]!
                                                        .audioTrack
                                                        .toString());*/
                                                      Get.to(MusicplayerView(),
                                                          arguments: [
                                                            controller
                                                                .mediaItems
                                                                .value,
                                                            index
                                                          ], opaque: false);
                                                    },

                                                    child: ListTile(
                                                      leading: Transform.translate(offset: Offset(-16, 0),
                                                        child: SizedBox(
                                                          height: 42.0,
                                                          width: 46.32,
                                                          // fixed width and height
                                                          child: Container(
                                                            child: CachedNetworkImage(
                                                              placeholder: (context, url) => Center(child: progressBAr()),
                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                              fit: BoxFit.fill,
                                                              imageUrl: (Get
                                                                  .find<
                                                                  HomeController>()
                                                                  .userfav
                                                                  .value
                                                                  .favoriteTracks
                                                                  ?.tracks?[index]
                                                                  ?.thumbnailImage).toString(),
                                                              imageBuilder: (context, imageProvider) {
                                                                // you can access to imageProvider
                                                                return ClipRRect(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  child: Image.network(
                                                                    (Get
                                                                        .find<
                                                                        HomeController>()
                                                                        .userfav
                                                                        .value
                                                                        .favoriteTracks
                                                                        ?.tracks?[index]
                                                                        ?.thumbnailImage).toString(),
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                );
                                                              },
                                                            ),

                                                          ),
                                                        ),
                                                      ),
                                                      title: Transform.translate(offset: Offset(-16, 0),
                                                        child: textWidget(
                                                          "${Get
                                                              .find<
                                                              HomeController>()
                                                              .userfav
                                                              .value
                                                              .favoriteTracks
                                                              ?.tracks?[index]
                                                              ?.title}",
                                                          TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                      ),
                                                      subtitle: Transform.translate(offset: Offset(-16, 0),
                                                        child: textWidget(
                                                          "${Get
                                                              .find<
                                                              HomeController>()
                                                              .userfav
                                                              .value
                                                              .favoriteTracks
                                                              ?.tracks?[index]
                                                              ?.artist}",
                                                          TextStyle(
                                                            color: Color(
                                                                0xFF818181),
                                                          ),
                                                        ),
                                                      ),
                                                      trailing: InkWell(
                                                        onTap: () async {
                                                          await controller
                                                              .removeFav((Get
                                                              .find<
                                                              HomeController>()
                                                              .userfav
                                                              .value
                                                              .favoriteTracks
                                                              ?.tracks?[index]
                                                              ?.Id).toString());
                                                          controller
                                                              .addFavDataToPlay();
                                                        },
                                                        child:
                                                            SvgPicture.asset(
                                                          "assets/svg/activefav.svg",
                                                        )

                                                      ),
                                                    ),
                                                  ),
                                            ),
                                            Divider(),
                                          ],
                                        );
                                      });
                                }
                                else{
                                  return Center(child:Text("Add songs to your favorites",style: GoogleFonts.nunito(),));
                                }

                              }
                              return Center(
                                child: progressBAr(),
                              );
                            },
                          ),
                        ),
                      ]),
                ),
              ),
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
                    ),
                    textWidget(
                        "Your Favorites",
                        GoogleFonts.nunito(fontWeight: FontWeight.bold,
                            color: ColorUtil.kPrimaryBlack,
                            fontSize: 17)),

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
                    return playing == AudioProcessingState.ready ?small_player():SizedBox();
                  }
              )),
            ],
          )),
    );
  }
}
