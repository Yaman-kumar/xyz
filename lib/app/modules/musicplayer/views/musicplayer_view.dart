import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xyz/app/modules/categories/controllers/categories_controller.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/audio_player_utils.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';
import 'package:xyz/services/textstyles.dart';

import '../controllers/musicplayer_controller.dart';

class MusicplayerView extends GetView<MusicplayerController> {
  @override
  Widget build(BuildContext context) {
    BuildContext? scaffoldContext;
    Get.find<MusicplayerController>();
    return
        //Obx(
        //() =>
        Dismissible(
      // onResize:(){
      //   Get.back();
      //
      // },
      direction: DismissDirection.down,
      //  background: Container(color: Colors.transparent),
      key: const Key('playScreen'),
      onDismissed: (direction) {
        Get.back();
        // Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: ColorUtil.kPrimaryWhite,

        body: Center(
          child: Stack(
            children: [
              ArtUri(),
              Container( height: double.infinity,
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
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        SongName(size: 20.kh),
                        InkWell(
                          onTap: () {},
                          child: Artist(
                            size: 12.kh,
                          ),
                        ),
                      ],
                    ),
                 //   Align(alignment: Alignment(-1.0, 10.0),child: Text("HEllo ")),
                    SizedBox(height: 445.kh,),
                    AudioControlButtons(),
                    SizedBox(
                      height: 25.kh,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AudioProgressBar(),
                    ),
                    SizedBox(
                      height: 25.kh,
                    ),

                    SizedBox(height: 30.kh),

                  ],
                ),
              ),

              Positioned(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,54,0,0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(onTap: (){
                      Get.back();
                    },
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: ColorUtil.kPrimaryWhite,
                      ),
                    ),
                    Text(
                        (Get.find<CategoriesController>().nameSelectedCategories).toString(),
                      style:GoogleFonts.nunito(color: ColorUtil.kPrimaryWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),

                    ),
                    Text(""),
                    /*Icon(
                      Icons.share,
                      color: ColorUtil.kPrimaryWhite,
                    ),*/
                  ],
              ),
                ),),

            ],
          ),
        ),
      ),
    );
    //);
  }
}
