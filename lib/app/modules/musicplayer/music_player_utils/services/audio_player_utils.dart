import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xyz/app/modules/musicplayer/controllers/musicplayer_controller.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/notifiers/play_button_notifier.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/notifiers/progress_notifier.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/notifiers/repeat_button_notifier.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/page_manager.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/service_locator.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/services/textstyles.dart';
import 'package:xyz/widget/global_widget.dart';

class CurrentSongTitle extends StatelessWidget {
  const CurrentSongTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<String>(
      valueListenable: pageManager.currentSongTitleNotifier,
      builder: (_, title, __) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(title, style: GoogleFonts.nunito(fontSize: 40)),
        );
      },
    );
  }
}

class Playlist extends StatelessWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return Expanded(
      child: ValueListenableBuilder<List<String>>(
        valueListenable: pageManager.playlistNotifier,
        builder: (context, playlistTitles, _) {
          return ListView.builder(
            itemCount: playlistTitles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${playlistTitles[index]}'),
              );
            },
          );
        },
      ),
    );
  }
}

class ArtUri extends StatelessWidget {
  const ArtUri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<Uri?>(
      valueListenable: pageManager.currentArtUriNotifier,
      builder: (context, value, _) {

        return
          CachedNetworkImage(
            progressIndicatorBuilder: (context,url,ProgessIndicator) => Center(child: progressBAr()),
            // placeholder: (context, url) => Center(child: progressBAr()),
            errorWidget: (context, url, error) => SizedBox(),
            fit: BoxFit.fill,
            imageUrl: "${value}",
            imageBuilder: (context, imageProvider) {
              // you can access to imageProvider
              return Container(
                height: 816.kh,
                width: double.infinity,
                decoration: BoxDecoration(

                    image: DecorationImage(image: imageProvider,fit:BoxFit.fill ),
                    color: Colors.black12
                ),
              );
            },
          );




      },
    );
  }
}

class Artist extends StatelessWidget {
  final double size;
   Artist({Key? key,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<String?>(
      valueListenable: pageManager.currentSongArtistNotifier,
      builder: (context, value, _) {
        return Text(
          "${value??""}",
          style: TextStyle(
              color: ColorUtil.kPrimaryWhite,
              fontWeight: FontWeight.bold,
              fontSize: 14.kh),
        );
      },
    );
  }
}
// class SongID extends StatelessWidget {
//
//   SongID({Key? key,required }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final pageManager = getIt<PageManager>();
//     return ValueListenableBuilder<String>(
//       valueListenable: pageManager.currentSongTitleNotifier,
//       builder: (context, value, _) {
//         return "$value";
//       },
//     );
//   }
// }
class SongName extends StatelessWidget {
  final double size;
   SongName({Key? key,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<String>(
      valueListenable: pageManager.currentSongTitleNotifier,
      builder: (context, value, _) {
        return Text(
          "$value",
          style:
          GoogleFonts.nunito(
            color: ColorUtil.kPrimaryWhite,
            fontWeight: FontWeight.bold,
            fontSize: 17.kh)
        );
      },
    );
  }
}

class Likes extends StatelessWidget {
  Likes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<String>(
      valueListenable: pageManager.totalLikesNotifiers,
      builder: (context, value, _) {
        return Text(
          "$value",
            style: GoogleFonts.nunito(
                color: Color(0xffDECEC5),
                fontSize: 14.kh,
                ),
        );
      },
    );
  }
}

class AddRemoveSongButtons extends StatelessWidget {
  const AddRemoveSongButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: pageManager.add,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: pageManager.remove,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          baseBarColor: ColorUtil.primary_gray_1,
          timeLabelPadding: 10,
          thumbRadius: 0,
          bufferedBarColor: Colors.white60,
          thumbColor: ColorUtil.primary_purple_1,
          progressBarColor: ColorUtil.secondary_orange_allayya,
          barHeight: 3,
          timeLabelTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 14.kh,
              fontFamily: 'Montserrat-Regular',
              fontWeight: FontWeight.w500),
          progress: value.current,
          buffered: value.buffered,
          total:    value.total,
          onSeek: pageManager.seek,
        );
      },
    );
  }
}


class AudioProgressBarMiniPlayer extends StatelessWidget {
  const AudioProgressBarMiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          timeLabelLocation: TimeLabelLocation.none,
          baseBarColor: ColorUtil.primary_gray_1,
          timeLabelPadding: 10,
          thumbRadius: 1,
          bufferedBarColor: Colors.white60,
          thumbColor: ColorUtil.primary_purple_1,
          progressBarColor: ColorUtil.primary_purple_1,
          barHeight: 2.5,
          // timeLabelTextStyle: TextStyle(
          //     color: Colors.black,
          //     fontSize: 14.kh,
          //     fontFamily: 'Montserrat-Regular',
          //     fontWeight: FontWeight.w500),
          progress: value.current,
          buffered: value.buffered,
          total:    value.total,
          onSeek: pageManager.seek,
        );
      },
    );
  }
}

class LikeButton extends StatelessWidget {
  final ontap;
  final ontapFalse;
  const LikeButton({Key? key,required this.ontap,required this.ontapFalse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isliked,
      builder: (_, value, __) {
        return Container(
          width: 95.kw,
          height: 45.kh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.black54,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white38,
                maxRadius: 15,
                child: IconButton(
                    onPressed:value == false ? ontapFalse : ontap,
                  //      () {

                      // getIt<PageManager>().listenToLikeChanges();
                      // controller.listenToTotalDuration();
                      // controller.Deletelike(
                      //     "${controller.listenToTotalDuration()}"


                     // );
                 //   },
                    icon: Icon(
                      Icons.favorite,
                       color: value == true
                          ? Colors.red
                          : Color(0xffDECEC5),
                      size: 12,
                    )),
              ),
              // Text(
              //   "${controller.LikeCount.value}",
              //   style: TextStyle(
              //       color: Color(0xffDECEC5),
              //       fontSize: 14.kh,
              //       fontFamily: 'Montserrat-Regular'),
              // ),
              Likes(),
              SizedBox(
                width: 2.kw,
              ),
            ],
          ),
        );
      },
    );
  }
}

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ShuffleButton(),
          PreviousSongButton(),
          PlayButton(),
          NextSongButton(),

          RepeatButton(),
        ],
      ),
    );
  }
}

class RepeatButton extends StatelessWidget {
  const RepeatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<RepeatState>(
      valueListenable: pageManager.repeatButtonNotifier,
      builder: (context, value, child) {
        Widget icon;
        switch (value) {
          case RepeatState.off:
            icon = Container(height:40 ,width: 40,
                  decoration: BoxDecoration(
                    color:Color.fromRGBO(0, 0, 0, 0.28),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.replay,color: Colors.grey),);


              //  Icon(Icons.replay, color: Colors.grey);
            break;
          case RepeatState.repeatSong:
            icon = Container(height:40 ,width: 40,
              decoration: BoxDecoration(
                color:Color.fromRGBO(0, 0, 0, 0.28),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.replay,color: Colors.white),);

                //Icon(Icons.replay,color: Colors.white);
            break;
          case RepeatState.repeatPlaylist:
            icon = Container(height:40 ,width: 40,
              decoration: BoxDecoration(
                color:Color.fromRGBO(0, 0, 0, 0.28),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.replay_circle_filled,color: Colors.white),);

                //Icon(Icons.replay_circle_filled,color: Colors.white);
            break;
        }
        return IconButton(
          icon: icon,
          onPressed: pageManager.repeat,
        );
      },
    );
  }
}

class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    MusicplayerController controller = Get.find<MusicplayerController>();
    final _audioHandler = getIt<AudioHandler>();

    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return GestureDetector(
            onTap: (){
              if(isFirst){
                //controller.index.value =   controller.index.value;
              ///  return  pageManager.loadPlaylist([controller.mediaItems[controller.index.value - 1],controller.mediaItems[controller.index.value ], controller.mediaItems[controller.index.value + 1]],2);
              } else{
               // controller.index.value = controller.index.value - 1;
                return  pageManager.previous();
              }
            },
            //(isFirst) ? null : pageManager.previous,
            child: Container(height:40 ,width: 40,
              decoration: BoxDecoration(
                color:Color.fromRGBO(0, 0, 0, 0.28),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/music_icon2.svg",
                ),
              ),
            ),);

        //   IconButton(
        //   icon: Icon(Icons.skip_previous),
        //   onPressed: (isFirst) ? null : pageManager.previous,
        // );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50,child: Center(
                child: Container(
                  height:64 ,width: 64,
                  decoration: BoxDecoration(
                    //color: ColorUtil.kPrimaryWhite,
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.all(8.0),
                  // width: 32.0,
                  // height: 32.0,
                  child: Center(child: progressBAr())
                ),
              ),
            );
          case ButtonState.paused:
            return GestureDetector(
              onTap: pageManager.play,
              child: Container(
                height:64 ,width: 64,

                child: Center(
                  child: SvgPicture.asset("assets/svg/play_button.svg",)

                  // IconButton(
                  //   color: Colors.black,
                  //   icon: Icon(Icons.play_arrow),
                  //   iconSize: 32.0,
                  //   onPressed: pageManager.play,
                  // ),
                ),
              ),
            );

            IconButton(
              icon: Icon(Icons.play_arrow),
              iconSize: 32.0,
              onPressed: pageManager.play,
            );
          case ButtonState.playing:
            return  GestureDetector(
              onTap: pageManager.pause,

              child: Container(
                height:64 ,width: 64,

                child: Center(
                    child: SvgPicture.asset("assets/svg/play.svg",color: Colors.white,)

                  // IconButton(
                  //   color: Colors.black,
                  //   icon: Icon(Icons.play_arrow),
                  //   iconSize: 32.0,
                  //   onPressed: pageManager.play,
                  // ),
                ),
              ),
            );

            //   IconButton(
            //   icon: Icon(Icons.pause),
            //   iconSize: 32.0,
            //   onPressed: pageManager.pause,
            // );
        }
      },
    );
  }
}

class NextSongButton extends StatelessWidget {
   NextSongButton({Key? key}) : super(key: key);

  @override
  MusicplayerController controller = Get.find<MusicplayerController>();
   final _audioHandler = getIt<AudioHandler>();

  Widget build(BuildContext context) {

    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        print("gvhgvgh  :: ${_audioHandler.queue.value.length}");
        return GestureDetector(
            onTap:(){
              if(Platform.isIOS){
              if(isLast){
              //  controller.index.value =   controller.index.value + 1;
              //return  pageManager.loadPlaylist([controller.mediaItems[controller.index.value - 1],controller.mediaItems[controller.index.value ], controller.mediaItems[controller.index.value + 1]], 0);
              } else{
             //   controller.index.value = controller.index.value + 1;
            return  pageManager.next();
              }

            }else{
                return  pageManager.next();
              }} ,
            child: Container(height:40 ,width: 40,
              decoration: BoxDecoration(
                color:Color.fromRGBO(0, 0, 0, 0.28),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/music_icon3.svg",
                ),
              ),
            ),);
        //   IconButton(
        //   icon: Icon(Icons.skip_next),
        //   onPressed: (isLast) ? null : pageManager.next,
        // );
      },
    );
  }
}

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isShuffleModeEnabledNotifier,
      builder: (context, isEnabled, child) {
        return IconButton(
          icon: (isEnabled)
              ? Container(height:40 ,width: 40,
              decoration: BoxDecoration(
                color:Color.fromRGBO(0, 0, 0, 0.28),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.shuffle,color: ColorUtil.kPrimaryWhite,))
              : Container(height:40 ,width: 40,
              decoration: BoxDecoration(
                color:Color.fromRGBO(0, 0, 0, 0.28),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.shuffle, color: Colors.grey)),
          onPressed: pageManager.shuffle,
        );
      },
    );
  }
}

