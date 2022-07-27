import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xyz/app/modules/categories/controllers/categories_controller.dart';
import 'package:xyz/app/modules/home/controllers/home_controller.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/MiniPlayer.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/service_locator.dart';
import 'package:xyz/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:xyz/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:xyz/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:xyz/app/routes/app_pages.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';

Widget textWidget(String text, TextStyle style) {
  return Text(
    text,
    style: style,
  );
}

Widget richTextWidget(TextStyle style1, TextStyle style2) {
  return InkWell(
    onTap: () {
      Get.toNamed('/login');
    },
    child: RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: GoogleFonts.nunito(
          fontSize: 14.0.kh,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: 'Already have an account? ', style: style1),
          TextSpan(text: 'Log In', style: style2),
        ],
      ),
    ),
  );
}

Widget buttonWidget(String event, String name, color, TextStyle style) {
  return SizedBox(
    width: 343.kw,
    height: 48.kh,
    child: Obx(
      () => ElevatedButton(
        onPressed: () async {
          if (name == "Continue") {
            if (Get.find<WelcomeController>().selectedList.length >= 1) {
               Get.find<WelcomeController>().postWelcomeData();
              Get.toNamed(event);
            }
          } else if (event == '/otp') {
            print(
                "what is the value of : ${Get.find<SignUpController>().textEditingController.value.text}");
            Get.find<SignUpController>().mobileVeryFication(
                "+91${Get.find<SignUpController>().textEditingController.value.text}");
          } else if (event == '/welcome') {
            print(
                "what is the value of : ${Get.find<SignUpController>().textEditingController.value.text}");
            Get.find<SignUpController>().OtpVerification();
          }
          else
            Get.toNamed(event);
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          shadowColor:
              MaterialStateProperty.all(ColorUtil.secondary_orange_allayya),
          backgroundColor: Get.find<WelcomeController>().activeValue.value !=
                      "no use" &&
                  name == "Continue" &&
                  Get.find<WelcomeController>().selectedList.length >= 1
              ? MaterialStateProperty.all(ColorUtil.secondary_orange_allayya)
              : MaterialStateProperty.all(color),
          // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.kh),
              //side: BorderSide(color: Colors.red)
            ),
          ),
        ),
        child: Text(
          name,
          style: style,
        ),
      ),
    ),
  );
}

Widget authenticationLogoWidget(String pathAssete, String authName) {
  return InkWell(
    onTap: () {
      if (authName == "google") {
        Get.find<SignUpController>().signInWithGoogle();
      }
    },
    child: Container(
        height: 48.kh,
        width: 48.kh,
        padding: EdgeInsets.all(10.kh),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.kh),
          color: ColorUtil.kPrimaryWhite,
        ),
        child: SvgPicture.asset(
          pathAssete,
        )),
  );
}

Widget welcomeCircle(
    color, String pathAssete, String text, index, double size) {
  // var nameText = WelcomeController.to.list.indexOf(text)+1;

  //var nameText =Get.find<WelcomeController>().list.indexOf(text)+1;
  return Column(
    children: [
      Obx(
        () => Container(
          width: size.kw,
          height: size.kh,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Get.find<WelcomeController>().activeValue.value ==
                        "no use" ||
                    Get.find<WelcomeController>().selectedList.contains(index)
                ? Border.all(color: Color(0xFFF89E53), width: 2.kw)
                : Border(),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
                spreadRadius: 0.0,
               // offset: Offset(2.0, 2.0), // shadow direction: bottom right
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Get.find<WelcomeController>().updateActiveWelcome(index);
            },
            child: Container(
              margin: EdgeInsets.all(size == 100 ? 10.kh : 6.kh),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    pathAssete), // no matter how big it is, it won't overflow
              ),
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0.kh),
        child: Text(
          text,
          style: GoogleFonts.nunito(fontSize: size == 100 ? 14 : 12),
        ),
      ),
    ],
  );
}

Widget welcomeCircleSmall(
    color, String pathAssete, String text, index, double size) {
  // var nameText = WelcomeController.to.list.indexOf(text)+1;
//  var nameText =Get.find<WelcomeController>().list.indexOf(text)+1;
  return Column(
    children: [
      Container(
        width: size.kw,
        height: size.kh,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          //  border:Border.all(color: Color(0xFFF89E53),width: 2.kw),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 1,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            ),
          ],
        ),
        child: InkWell(
          onTap: () async {
            Get.find<HomeController>().selectedCategories(index - 1);
            await Get.find<CategoriesController>().fetchSubCaCategoriesData();
            Get.toNamed('/categories');
          },
          child: Container(
            margin: EdgeInsets.all(size == 100 ? 10.kh : 6.kh),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  pathAssete), // no matter how big it is, it won't overflow
            ),
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        ),
      ),
      SizedBox(
        height: 10.kh,
      ),
      Padding(
        padding: EdgeInsets.all(0.0),
        child: Text(
          text,
          style: GoogleFonts.nunito(fontSize: 12),
          //overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

Widget homeCardWidget(String pathAssets, String numberOfTrack, String name,String id) {
  return InkWell(
    onTap: () {
      Get.find<CategoriesController>().imageSelectedCategories=pathAssets;
      Get.find<CategoriesController>().nameSelectedCategories=name;
      Get.find<CategoriesController>().subCategoriesId.value=id;
      Get.toNamed(
        Routes.TRACK,
      );
    },
    child: Center(
      child: Container(
          height: 169.kh,
          width: 164.kw,
          margin: const EdgeInsets.only(
              left: 5, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: ColorUtil.kPrimaryWhite,
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(90,41, 5, 0.12),
                blurRadius: 5,
                spreadRadius:1,

              ),

            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: ColorUtil.kPrimaryWhite),
                margin: EdgeInsets.all(8),
                height: 102.kh,
                width: 148.kw,
                child:

                CachedNetworkImage(
                  placeholder: (context, url) => Center(child: progressBAr()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.fill,
                  imageUrl: pathAssets,
                  imageBuilder: (context, imageProvider) {
                    // you can access to imageProvider
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(height: 102.kh,
                        width: 148.kw,
                      decoration: BoxDecoration(image:DecorationImage(image: imageProvider,fit: BoxFit.cover) ),)
                    );
                  },
                ),
              ),

              Container(

                margin: EdgeInsets.fromLTRB(8.kh, 0, 8.kh, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(
                        '${name}',
                        GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.kh,
                            color: ColorUtil.kPrimaryBlack),
                        /*TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.kh,
                        color: ColorUtil.kPrimaryBlack),*/
                      ),
                      textWidget(
                        '${numberOfTrack} Tracks',
                        GoogleFonts.nunito(
                            fontSize: 12.kh, color: ColorUtil.kPrimaryBlack),
                        /*TextStyle(fontSize: 12.kh, color: ColorUtil.kPrimaryBlack),*/
                      ),
                    ]),
              ),
            ],
          )),
    ),
  );
}

Widget homeFavoriteCardWidget(String imageUrl, String title, String subTitle) {
  return InkWell(
    onTap: () {
     // Get.toNamed(Routes.MUSICPLAYER);
    },
    child: Center(
      child: Container(
        width: 209.kw,
        height: 95.kw,

        margin: const EdgeInsets.only(
            left: 5, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: ColorUtil.kPrimaryWhite,

            boxShadow: [
              BoxShadow(color: Color.fromRGBO(90,41, 5, 0.12),
                blurRadius: 5,
                spreadRadius:1,

              ),

            ],

        ),
        child: Row(
          children: [
            Container(

              height: 79.kw,
              width: 85.kw,
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              // color: Colors.red,
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(child: progressBAr()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill,
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) {
                  // you can access to imageProvider
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child:Container( height: 79.kw,
                      width: 85.kw,
                      decoration: BoxDecoration(image:DecorationImage(image: imageProvider,fit: BoxFit.cover) ),)

                  );
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 100.kw,
                  child: textWidget(
                      "${title}",
                      GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                              .kh) /*TextStyle(fontWeight: FontWeight.bold, fontSize: 14.kh)*/),
                ),
                //  T
                //  ext("Daily Calm"),

                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 100.kw,
                  child: textWidget(
                      "${subTitle}",
                      GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.kh,
                          color: Colors.black26)),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget bottomNavigationDesign(context) {
  return StreamBuilder<AudioProcessingState>(
      stream: getIt<AudioHandler>().playbackState.map((state) => state.processingState).distinct(),
      builder:
          (context,snapshot) {
        final playing = snapshot.data ?? AudioProcessingState.idle;
      return Container(height: playing == AudioProcessingState.ready ?150.kh:80.kh,width: double.infinity,
        child: Column(
          children: [
            playing == AudioProcessingState.ready ?small_player():SizedBox(),
            Container(
              height: 80.kh,
              decoration: BoxDecoration(
                color: ColorUtil.kPrimaryWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(
                    () => Column(
                      children: [
                        IconButton(
                          enableFeedback: false,
                          onPressed: () {
                            Get.put(NavbarController()).pageIndexValue(1);
                            Get.toNamed('/home');
                          },
                          icon: Get.put(NavbarController()).pageIndex.value == 1
                              ? SvgPicture.asset(
                                  "assets/svg/home_active.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/svg/home_inactive.svg",
                                ),
                        ),
                        Text(
                          "Home",
                          style: GoogleFonts.nunito(
                              color: Get.put(NavbarController()).pageIndex.value == 1
                                  ? ColorUtil.kPrimaryBlack
                                  : Color(0xFF7B7B7B),
                              fontSize: 12.kh),
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        IconButton(
                          enableFeedback: false,
                          onPressed: () {
                            Get.put(NavbarController()).pageIndexValue(2);
                            Get.toNamed('/discover');
                          },
                          icon: Get.put(NavbarController()).pageIndex.value == 2
                              ? SvgPicture.asset(
                                  "assets/svg/search_active.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/svg/search_inactive.svg",
                                ),
                        ),
                        Text(
                          "Discover",
                          style: GoogleFonts.nunito(
                              color: Get.put(NavbarController()).pageIndex.value == 2
                                  ? ColorUtil.kPrimaryBlack
                                  : Color(0xFF7B7B7B),
                              fontSize: 12.kh),
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        IconButton(
                          enableFeedback: false,
                          onPressed: () {
                            Get.put(NavbarController()).pageIndexValue(3);
                            Get.toNamed('/notification');
                          },
                          icon: Get.put(NavbarController()).pageIndex.value == 3
                              ? SvgPicture.asset(
                                  "assets/svg/notification_active.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/svg/notification_inactive.svg",
                                ),
                        ),
                        Text(
                          "Notification",
                          style: GoogleFonts.nunito(
                              color: Get.put(NavbarController()).pageIndex.value == 3
                                  ? ColorUtil.kPrimaryBlack
                                  : Color(0xFF7B7B7B),
                              fontSize: 12.kh),
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        IconButton(
                          enableFeedback: false,
                          onPressed: () {
                            Get.put(NavbarController()).pageIndexValue(4);
                            Get.toNamed('/setting');
                          },
                          icon: Get.put(NavbarController()).pageIndex.value == 4
                              ? SvgPicture.asset(
                                  "assets/svg/setting_active.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/svg/setting_inactive.svg",
                                ),
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              color: Get.put(NavbarController()).pageIndex.value == 4
                                  ? ColorUtil.kPrimaryBlack
                                  : Color(0xFF7B7B7B),
                              fontSize: 12.kh),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  );
}

Widget notificationCardWidget(String title, String subtitle) {
  return Card(
    elevation: 2,
    shadowColor: ColorUtil.kPrimaryBlack,
    child: ListTile(
      leading: Container(
        height: 24.0,
        width: 24.0, // fixed width and height

        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          color: ColorUtil.secondary_orange_allayya,
        ),
        child: Center(child: SvgPicture.asset("assets/svg/music_player.svg")),
      ),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: textWidget(
          "${title}",
          GoogleFonts.nunito(),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 8),
        child: textWidget(
            "${subtitle}", GoogleFonts.nunito(color: Color(0xFF7B7B7B))),
      ),
    ),
  );
}

PreferredSizeWidget appBarWithTabWidget(Widget icon, String name) {
  return AppBar(
    leading: InkWell(
        onTap: () {
         // Get.find<CategoriesController>().tabController!.dispose();
          Get.back();
          //  Get.find<CategoriesController>().tabController!.dispose();
        },
        child: icon),
    elevation: 0.0,
    backgroundColor: ColorUtil.allayya_background,
    title: Text(
      name,
      style:
          GoogleFonts.nunito(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    bottom: TabBar(
      controller: Get.find<CategoriesController>().tabController,
      isScrollable: true,
      indicatorColor: ColorUtil.secondary_orange_allayya,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: List.generate(
          Get.find<HomeController>().userdetails.value.categories!.length,
          (index) {
        return Container(
            height: 50,
            child: Center(
                child: textWidget(
                    "${Get.find<HomeController>().userdetails.value.categories![index]!.name}",
                    GoogleFonts.nunito(color: ColorUtil.kPrimaryBlack))));
      }),
    ),
  );
}

PreferredSizeWidget appBarWithIconWidget(Widget icon, String name) {
  return AppBar(
    elevation: 0.0,
    leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: icon),
    backgroundColor: ColorUtil.allayya_background,
    title: Text(
      name,
      style:
          GoogleFonts.nunito(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
  );
}

PreferredSizeWidget appBarforUserProfile(Widget icon, String name) {
  return AppBar(
    elevation: 0.0,
    leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: icon),
    backgroundColor: ColorUtil.allayya_background,
    title: Text(
      name,
      style: GoogleFonts.nunito(color: Colors.black),
    ),
    centerTitle: true,
    actions: [
      InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(14),
            padding: EdgeInsets.all(7),
            height: 32.kh,
            width: 32.kh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xFFF89E53),
            ),
            child: SvgPicture.asset("assets/svg/check.svg"),
          ))
    ],
  );
}

PreferredSizeWidget appBarWithoutIconWidget(String name, TextStyle style) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: ColorUtil.allayya_background,
    automaticallyImplyLeading: false,
    title: Text(
      name,
      style: style,
    ),
    centerTitle: true,
  );
}

Widget progressBAr() {
  return CircularProgressIndicator(
    color: ColorUtil.secondary_orange_allayya_deactive,
  );
}
