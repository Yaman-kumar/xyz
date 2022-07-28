
import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xyz/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:xyz/app/modules/musicplayer/controllers/musicplayer_controller.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/page_manager.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/audio_player_utils.dart';
import 'package:xyz/app/modules/musicplayer/views/musicplayer_view.dart';
import 'package:xyz/app/modules/track/controllers/track_controller.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/services/textstyles.dart';
import 'package:xyz/widget/global_widget.dart';


import 'services/service_locator.dart';

class small_player extends StatelessWidget {
bool status;
   small_player({Key? key,required this.status}) : super(key: key);
var switchss  = true;
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    //final audioHandler = getIt<AudioHandler>().mediaItem as ValueNotifier<double>;

    return Container(
      //width: double.infinity,
      height: 70.kh,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 12,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            )
          ],

          color: Color(0xFFFDCFA6)
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 20.kw,
              ),
              ValueListenableBuilder<Uri?>(
                valueListenable: pageManager.currentArtUriNotifier,
                builder: (_, title, __) {
                  return CachedNetworkImage(
                    imageUrl: title == null
                        ? "https://media.istockphoto.com/vectors/vintage-vinyl-records-out-of-the-box-template-empty-gramophone-cover-vector-id1041993546?k=20&m=1041993546&s=612x612&w=0&h=Y9cicLUdxlAUK9XIig76dlx3b6dL2Q2wRYjn3y-jkZU="
                        : "${title}",
                    imageBuilder: (context, imageProvider) => Center(
                      child: Container(
                        width: 50.kw,
                        height: 50.kh,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    progressIndicatorBuilder: (context, url, dowanload)=>progressBAr(),
                    errorWidget: (context, url, error) => Container(
                      width: 50.kw,
                      height: 50.kh,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://media.istockphoto.com/vectors/vintage-vinyl-records-out-of-the-box-template-empty-gramophone-cover-vector-id1041993546?k=20&m=1041993546&s=612x612&w=0&h=Y9cicLUdxlAUK9XIig76dlx3b6dL2Q2wRYjn3y-jkZU="),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder<String>(
                      valueListenable: pageManager.currentSongTitleNotifier,
                      builder: (_, title, __) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: TextStyleUtil.textMontserratStyleS17W600CBlack()),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    ValueListenableBuilder<String?>(
                      valueListenable: pageManager.currentSongArtistNotifier,
                      builder: (_, title, __) {
                        return Text("${title}",
                            style: GoogleFonts.nunito(
                              fontSize: 12.kh,
                              color: Colors.black,
                            ));
                      },
                    ),
                  ],
                ),
              ),
              Spacer(),


              /*ValueListenableBuilder<Map>(
                    valueListenable: pageManager.valueMap,
                    builder: (_, value, __) {
                    //  Get.find<MusicplayerController>().favIconColor.value=value['isFav'];
                      print("value :: ${value['isFav']}");
                      if(value['isFav']=='true' && Get.find<MusicplayerController>().favIconColor.value='false'){
                        return InkWell(onTap: (){
                          Get.find<MusicplayerController>().favIconColor.value='false';
                        },child:Get.find<MusicplayerController>().favIconColor.value='false'? SvgPicture.asset("assets/svg/activefav.svg"):SvgPicture.asset("assets/svg/activefav.svg")
                        );
                      }
                      else{
                        return InkWell(onTap: (){
                          Get.find<MusicplayerController>().favIconColor.value='true';
                        },child: SvgPicture.asset("assets/svg/heart_inactive.svg"));
                      }
                     // value['isFav']==true?? return SvgPicture.asset("assets/svg/activefav.svg"):return SvgPicture.asset("assets/svg/heart_inactive.svg");

                    },
                  ),*/

              // status ==true? SizedBox():
              //
              // ValueListenableBuilder<Map>(
              //   valueListenable: pageManager.valueMap,
              //   builder: (_, value, __) {
              //     MusicplayerController musicplayer = Get.find<MusicplayerController>();
              //     //print("value :: $value");
              //
              //     //value == null ? 'false' : value['isFav'];
              //   musicplayer.favIconColor.value = '${value['isFav']}';
              //     return  Obx(() => InkWell(onTap:(){
              //       switchss = false;
              //       print("Okay");
              //     //  musicplayer.favIconColor.value = 'true';
              //       if(musicplayer.favIconColor.value=='false'){
              //         musicplayer.favIconColor.value = 'true';
              //         Get.find<TrackController>().addFav(value['id']);
              //
              //       //  Get.find<FavoriteController>().favStatus.value=false;
              //        // Get.find<FavoriteController>().addFavDataToPlay();
              //       }
              //       else{
              //         musicplayer.favIconColor.value = 'false';
              //         Get.find<TrackController>().removeFav(value['id']);
              //
              //    //  Get.find<TrackController>().addFav(value['id']);
              //      //value['isFav'] == 'true';
              //       }
              //       //musicplayer.favIconColor.value = musicplayer.favIconColor.value=='true'? 'false':'true';
              //
              //       // Get.find<TrackController>().addFav(value.toString());
              //
              //     },child: musicplayer.favIconColor.value == 'true'? SvgPicture.asset("assets/svg/activefav.svg"):SvgPicture.asset("assets/svg/heart_inactive.svg")),
              //     );
              //
              //
              //     //   Obx(()=>
              //     //    InkWell(onTap:(){
              //     //      Get.find<MusicplayerController>().favIconColor.value=(Get.find<MusicplayerController>().favIconColor.value=='true')?'false':'true';
              //     //         if(Get.find<MusicplayerController>().favIconColor.value=='false'){
              //     //           Get.find<TrackController>().removeFav(value['id']);
              //     //           Get.find<FavoriteController>().favStatus.value=false;
              //     //           Get.find<FavoriteController>().addFavDataToPlay();
              //     //         }
              //     //         else{
              //     //           Get.find<TrackController>().addFav(value['id']);
              //     //         }
              //     //                                // Get.find<TrackController>().addFav(value.toString());
              //     //
              //     //   },child:Get.find<MusicplayerController>().favIconColor.value=='true'? SvgPicture.asset("assets/svg/activefav.svg"):SvgPicture.asset("assets/svg/heart_inactive.svg")),
              //     // ) ;
              //   },
              // ),



              StreamBuilder<bool>(
                stream: getIt<AudioHandler>()
                    .playbackState
                    .map((state) => state.playing)
                    .distinct(),
                builder: (context, snapshot) {
                  final playing = snapshot.data ?? false;

                  return Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //_button(Icons.fast_rewind, getIt<AudioHandler>().rewind),
                      if (playing)
                        _button(Icons.pause_rounded, getIt<PageManager>().pause)
                      else
                        _button(
                            Icons.play_arrow_rounded, getIt<PageManager>().play),
                      //  _button(Icons.stop, getIt<AudioHandler>().stop),
                      //_button(Icons.fast_forward, getIt<AudioHandler>().fastForward),
                    ],
                  );
                },
              ),

              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                iconSize: 25.0,
                onPressed: () => getIt<AudioHandler>().stop(),
                //getIt<PageManager>().dispose(),
              ),
            ],
          ),

          //AudioProgressBarMiniPlayer(),

        ],
      ),
    );
    //   GestureDetector(
    //   onTap: (){
    //    // Get.to(MusicplayerView(),opaque: false);
    //
    //   },
    //   child: Container(
    //     //width: double.infinity,
    //     height: 70.kh,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
    //       boxShadow: [
    //         BoxShadow(
    //           offset: Offset(3, 3),
    //           blurRadius: 12,
    //           color: Color.fromRGBO(0, 0, 0, 0.16),
    //         )
    //       ],
    //
    //       color: Color(0xFFFDCFA6)
    //     ),
    //     child: Column(mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Row(
    //           children: [
    //             SizedBox(
    //               width: 20.kw,
    //             ),
    //             ValueListenableBuilder<Uri?>(
    //               valueListenable: pageManager.currentArtUriNotifier,
    //               builder: (_, title, __) {
    //                 return CachedNetworkImage(
    //                   imageUrl: title == null
    //                       ? "https://media.istockphoto.com/vectors/vintage-vinyl-records-out-of-the-box-template-empty-gramophone-cover-vector-id1041993546?k=20&m=1041993546&s=612x612&w=0&h=Y9cicLUdxlAUK9XIig76dlx3b6dL2Q2wRYjn3y-jkZU="
    //                       : "${title}",
    //                   imageBuilder: (context, imageProvider) => Center(
    //                     child: Container(
    //                       width: 50.kw,
    //                       height: 50.kh,
    //                       decoration: BoxDecoration(
    //                         shape: BoxShape.circle,
    //                         image: DecorationImage(
    //                           image: imageProvider,
    //                           fit: BoxFit.cover,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   progressIndicatorBuilder: (context, url, dowanload)=>progressBAr(),
    //                   errorWidget: (context, url, error) => Container(
    //                     width: 50.kw,
    //                     height: 50.kh,
    //                     decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                         image: NetworkImage(
    //                             "https://media.istockphoto.com/vectors/vintage-vinyl-records-out-of-the-box-template-empty-gramophone-cover-vector-id1041993546?k=20&m=1041993546&s=612x612&w=0&h=Y9cicLUdxlAUK9XIig76dlx3b6dL2Q2wRYjn3y-jkZU="),
    //                         fit: BoxFit.cover,
    //                       ),
    //                       shape: BoxShape.circle,
    //                       color: Colors.grey,
    //                     ),
    //                   ),
    //                 );
    //               },
    //             ),
    //             Padding(
    //               padding:  EdgeInsets.only(left: 20.0),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   ValueListenableBuilder<String>(
    //                     valueListenable: pageManager.currentSongTitleNotifier,
    //                     builder: (_, title, __) {
    //                       return Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(title,
    //                               style: TextStyleUtil.textMontserratStyleS17W600CBlack()),
    //                         ],
    //                       );
    //                     },
    //                   ),
    //                   SizedBox(
    //                     height: 3,
    //                   ),
    //                   ValueListenableBuilder<String?>(
    //                     valueListenable: pageManager.currentSongArtistNotifier,
    //                     builder: (_, title, __) {
    //                       return Text("${title}",
    //                           style: GoogleFonts.nunito(
    //                             fontSize: 12.kh,
    //                             color: Colors.black,
    //                           ));
    //                     },
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Spacer(),
    //
    //
    //                /*ValueListenableBuilder<Map>(
    //                 valueListenable: pageManager.valueMap,
    //                 builder: (_, value, __) {
    //                 //  Get.find<MusicplayerController>().favIconColor.value=value['isFav'];
    //                   print("value :: ${value['isFav']}");
    //                   if(value['isFav']=='true' && Get.find<MusicplayerController>().favIconColor.value='false'){
    //                     return InkWell(onTap: (){
    //                       Get.find<MusicplayerController>().favIconColor.value='false';
    //                     },child:Get.find<MusicplayerController>().favIconColor.value='false'? SvgPicture.asset("assets/svg/activefav.svg"):SvgPicture.asset("assets/svg/activefav.svg")
    //                     );
    //                   }
    //                   else{
    //                     return InkWell(onTap: (){
    //                       Get.find<MusicplayerController>().favIconColor.value='true';
    //                     },child: SvgPicture.asset("assets/svg/heart_inactive.svg"));
    //                   }
    //                  // value['isFav']==true?? return SvgPicture.asset("assets/svg/activefav.svg"):return SvgPicture.asset("assets/svg/heart_inactive.svg");
    //
    //                 },
    //               ),*/
    //
    //             // status ==true? SizedBox():
    //             //
    //             ValueListenableBuilder<Map>(
    //               valueListenable: pageManager.valueMap,
    //               builder: (_, value, __) {
    //                print("value :: $value");
    //                //value == null ? 'false' : value['isFav'];
    //                 return  Obx(() => InkWell(onTap:(){
    //                     Get.find<MusicplayerController>().favIconColor.value = 'true';
    //             //        Get.find<MusicplayerController>().favIconColor.value=(Get.find<MusicplayerController>().favIconColor.value=='true')?'false':'true';
    //                     // if(Get.find<MusicplayerController>().favIconColor.value=='false'){
    //                     //   Get.find<TrackController>().removeFav(value['id']);
    //                     //   Get.find<FavoriteController>().favStatus.value=false;
    //                     //   Get.find<FavoriteController>().addFavDataToPlay();
    //                     // }
    //                     //else{
    //
    //                       Get.find<TrackController>().addFav(value['id']);
    //                       value['isFav'] == 'true';
    //                     //}
    //                     // Get.find<TrackController>().addFav(value.toString());
    //
    //                   },child: Get.find<MusicplayerController>().favIconColor.value == 'true'? SvgPicture.asset("assets/svg/activefav.svg"):SvgPicture.asset("assets/svg/heart_inactive.svg")),
    //                 );
    //
    //
    //                 //   Obx(()=>
    //                 //    InkWell(onTap:(){
    //                 //      Get.find<MusicplayerController>().favIconColor.value=(Get.find<MusicplayerController>().favIconColor.value=='true')?'false':'true';
    //                 //         if(Get.find<MusicplayerController>().favIconColor.value=='false'){
    //                 //           Get.find<TrackController>().removeFav(value['id']);
    //                 //           Get.find<FavoriteController>().favStatus.value=false;
    //                 //           Get.find<FavoriteController>().addFavDataToPlay();
    //                 //         }
    //                 //         else{
    //                 //           Get.find<TrackController>().addFav(value['id']);
    //                 //         }
    //                 //                                // Get.find<TrackController>().addFav(value.toString());
    //                 //
    //                 //   },child:Get.find<MusicplayerController>().favIconColor.value=='true'? SvgPicture.asset("assets/svg/activefav.svg"):SvgPicture.asset("assets/svg/heart_inactive.svg")),
    //                 // ) ;
    //               },
    //             ),
    //
    //
    //
    //             StreamBuilder<bool>(
    //               stream: getIt<AudioHandler>()
    //                   .playbackState
    //                   .map((state) => state.playing)
    //                   .distinct(),
    //               builder: (context, snapshot) {
    //                 final playing = snapshot.data ?? false;
    //
    //                 return Row(
    //                   //mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     //_button(Icons.fast_rewind, getIt<AudioHandler>().rewind),
    //                     if (playing)
    //                       _button(Icons.pause_rounded, getIt<PageManager>().pause)
    //                     else
    //                       _button(
    //                           Icons.play_arrow_rounded, getIt<PageManager>().play),
    //                     //  _button(Icons.stop, getIt<AudioHandler>().stop),
    //                     //_button(Icons.fast_forward, getIt<AudioHandler>().fastForward),
    //                   ],
    //                 );
    //               },
    //             ),
    //
    //             IconButton(
    //               icon: Icon(
    //                 Icons.close,
    //                 color: Colors.grey,
    //               ),
    //               iconSize: 25.0,
    //               onPressed: () => getIt<AudioHandler>().stop(),
    //               //getIt<PageManager>().dispose(),
    //             ),
    //           ],
    //         ),
    //
    //         //AudioProgressBarMiniPlayer(),
    //
    //       ],
    //     ),
    //   ),
    // );
  }

  IconButton _button(IconData iconData, VoidCallback onPressed) => IconButton(
        icon: Icon(
          iconData,
          color: Colors.black,
        ),
        iconSize: 35.0,
        onPressed: onPressed,
      );

}
