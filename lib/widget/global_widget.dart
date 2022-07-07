import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xyz/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:xyz/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:xyz/services/colors.dart';
import 'package:xyz/services/responsiveSize.dart';


Widget textWidget(String text, TextStyle style){
  return Text(text,style: style,);
}

Widget richTextWidget(TextStyle style1,TextStyle style2){
  return InkWell(onTap: (){
    Get.toNamed('/login');
  },
    child: RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style:  TextStyle(
          fontSize: 14.0.kh,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: 'Already have an account? ',style:style1 ),
          TextSpan(text: 'Log In', style:style2 ),
        ],
      ),
    ),
  );
}

Widget buttonWidget(String event,String name,color,TextStyle style){

  return  SizedBox(width: 343.kw,height: 48.kh,
    child: Obx( ()=>
       ElevatedButton(
        onPressed: () {
          if(name=="Continue"){
            if(Get.put(WelcomeController()).selectedList.length>=3){
              Get.toNamed(event);
            }
          }
          else
          Get.toNamed(event);
        },
        style: ButtonStyle(elevation:MaterialStateProperty.all(2),shadowColor:MaterialStateProperty.all(ColorUtil.secondary_orange_allayya) ,
            backgroundColor:Get.put(WelcomeController()).activeValue.value!=0 && name=="Continue" &&Get.put(WelcomeController()).selectedList.length>=3 ?MaterialStateProperty.all(ColorUtil.secondary_orange_allayya) : MaterialStateProperty.all(color),
            // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.kh),
                  //side: BorderSide(color: Colors.red)
                ),
            ),
        ),

        child: Text(name,style: style,),
      ),
    ),
  );
}

Widget authenticationLogoWidget(String pathAssete){
  return  Container(height: 48.kh,width: 48.kh,padding:EdgeInsets.all(10.kh), decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.kh),color: ColorUtil.kPrimaryWhite,), child: SvgPicture.asset(
    pathAssete,
  ));
}

Widget welcomeCircle(color,String pathAssete,String text,index,double size){
 // var nameText = WelcomeController.to.list.indexOf(text)+1;
 
  var nameText =Get.find<WelcomeController>().list.indexOf(text)+1;
  return Column(
    children: [
      Obx(() =>
        Container(
          width: size.kw,
          height: size.kh,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Get.find<WelcomeController>().selectedList.contains(index)||Get.find<WelcomeController>().activeValue.value==nameText?Border.all(color: Color(0xFFF89E53),width: 2.kw):Border(),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              ),
            ],
          ),

          child: InkWell(onTap:(){
            Get.find<WelcomeController>().updateActiveWelcome(index);
          } ,
            child: Container(
              margin: EdgeInsets.all(size==100?10.kh:6.kh),
              child:Container(
                margin: EdgeInsets.all(size==100?20.kh:10.kh),
                child: SvgPicture.asset(
                  pathAssete,
                ),
              ) ,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color),),
          ),
          ),
      ),
      Padding(
        padding:EdgeInsets.all(8.0.kh),
        child: Text(text,style: TextStyle(fontSize: size==100?14:12),),
      ),
    ],
  );
}
Widget welcomeCircleSmall(color,String pathAssete,String text,index,double size){
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
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                ),
              ],
            ),

            child: InkWell(onTap:(){
            //  Get.find<WelcomeController>().updateActiveWelcome(index);
          Get.toNamed('/categories');
            } ,
              child: Container(
                margin: EdgeInsets.all(size==100?10.kh:6.kh),
                child:Container(
                  margin: EdgeInsets.all(size==100?20.kh:10.kh),
                  child: SvgPicture.asset(
                    pathAssete,
                  ),
                ) ,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color),),
            ),
          ),
      Padding(
        padding:EdgeInsets.all(8.0.kh),
        child: Text(text,style: TextStyle(fontSize: size==100?14:12),),
      ),
    ],
  );
}

Widget homeCardWidget(String pathAssets){
  return InkWell(onTap: (){
    Get.toNamed("/track");

  },
    child: Card(elevation: 5,shadowColor: Colors.black26,
      child: Container(
          height: 169.kh,
          width: 164.kw,
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(8)),
              color: ColorUtil.kPrimaryWhite),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 102.kh,
                width: 148.kw,
                margin: EdgeInsets.all(8.kh),
                child: Image(image: AssetImage(
                  pathAssets,),fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8.kh, 0, 8.kh, 0),
                child: Column(
                    children: [
                      textWidget(
                        'Nature',
                        TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.kh,
                            color: ColorUtil.kPrimaryBlack),
                      ),
                      textWidget(
                        '7 Tracks',
                        TextStyle(
                            fontSize: 12.kh,
                            color: ColorUtil.kPrimaryBlack),
                      ),
                    ]),
              ),
            ],
          )),
    ),
  );
}

Widget homeFavoriteCardWidget(){
  return InkWell(onTap: (){
    Get.toNamed('/player-ui');
  },

    child: SizedBox(
      width: 209.kw,
      height: 95.kw,
      child: Card(
        child: Row(
          children: [
            Container(
              height: 79.kw,
              width: 85.kw,
              margin:
              EdgeInsets.fromLTRB(8, 8, 8, 8),
              // color: Colors.red,
              child: Image(
                image: AssetImage(
                  "assets/images/home_image_7.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                textWidget("Daily Calm",TextStyle(fontWeight: FontWeight.bold,fontSize: 14.kh)),
                //  Text("Daily Calm"),
                SizedBox(
                  height: 6,
                ),
                SizedBox(width:100.kw,child:textWidget("Stereo Outdoor Sampling",TextStyle(fontWeight: FontWeight.bold,fontSize: 12.kh,color: Colors.black26)),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget bottomNavigationDesign(context){
    return Container(
      height: 80,
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
            Obx(()=>
              Column(
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      Get.put(NavbarController()).pageIndexValue(1);
                      Get.toNamed('/home');
                    },
                    icon: Get.put(NavbarController()).pageIndex.value == 1
                    ?SvgPicture.asset(
                      "assets/svg/home_active.svg"
                      ,
                    )
                        : SvgPicture.asset(
                      "assets/svg/home_inactive.svg",
                    ),
                  ),
                  Text("Home",style:TextStyle(color: Get.put(NavbarController()).pageIndex.value == 1?ColorUtil.kPrimaryBlack:Color(0xFF7B7B7B),fontSize: 12.kh) ,)

                ],
              ),
            ),
            Obx(()=>
               Column(
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      Get.put(NavbarController()).pageIndexValue(2);
                    Get.toNamed('/discover');
                    },
                    icon: Get.put(NavbarController()).pageIndex.value == 2
                        ?SvgPicture.asset(
                      "assets/svg/search_active.svg",

                    )
                        : SvgPicture.asset(
                      "assets/svg/search_inactive.svg",
                    ),
                  ),
                  Text("Discover",style:TextStyle(color: Get.put(NavbarController()).pageIndex.value == 2?ColorUtil.kPrimaryBlack:Color(0xFF7B7B7B),fontSize: 12.kh) ,)

                ],
              ),
            ),
            Obx(()=>
               Column(
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      Get.put(NavbarController()).pageIndexValue(3);
                      Get.toNamed('/notification');

                    },
                    icon: Get.put(NavbarController()).pageIndex.value == 3
                        ?SvgPicture.asset(
                      "assets/svg/notification_active.svg",
                    )
                        : SvgPicture.asset(
                      "assets/svg/notification_inactive.svg",

                    ),
                  ),
                  Text("Notification",style:TextStyle(color: Get.put(NavbarController()).pageIndex.value == 3?ColorUtil.kPrimaryBlack:Color(0xFF7B7B7B),fontSize: 12.kh) ,)

                ],
              ),
            ),
            Obx(()=>
               Column(
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      Get.put(NavbarController()).pageIndexValue(4);
Get.toNamed('/setting');
                    },
                    icon: Get.put(NavbarController()).pageIndex.value == 4
                        ?SvgPicture.asset(
                      "assets/svg/setting_active.svg",
                    )
                        : SvgPicture.asset(
                      "assets/svg/setting_inactive.svg",

                    ),
                  ),
                  Text("Settings",style:TextStyle(color: Get.put(NavbarController()).pageIndex.value == 4?ColorUtil.kPrimaryBlack:Color(0xFF7B7B7B),fontSize: 12.kh) ,)

                ],
              ),
            ),
          ],
        ),

    );
  }

  Widget notificationCardWidget(){
  return  Card(elevation: 2,shadowColor: ColorUtil.kPrimaryBlack,
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
        child: Center(
            child: SvgPicture.asset("assets/svg/music_player.svg")),
      ),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0,8,0,8),
        child: textWidget("How to improve your focus - New Playlist", TextStyle(),),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.fromLTRB(0,8,0,8),
        child: textWidget("We have introduced a new course which will help you improve your focus.", TextStyle(color: Color(0xFF7B7B7B),),),
      ),
    ),
  );

  }

PreferredSizeWidget appBarWithTabWidget(Widget icon,String name){
  return AppBar(leading: InkWell(onTap: (){
    Get.back();
  },child: icon),elevation: 0.0,backgroundColor: ColorUtil.allayya_background,
    title: Text(name,style: TextStyle(color: Colors.black),),
    centerTitle: true,
    bottom: TabBar(indicatorColor: ColorUtil.secondary_orange_allayya,
      tabs: [
        textWidget("Soundscapes", TextStyle(color: ColorUtil.kPrimaryBlack)),
        textWidget("Meditation", TextStyle(color: ColorUtil.kPrimaryBlack)),
        textWidget("Affirmations", TextStyle(color: ColorUtil.kPrimaryBlack)),
      ],
    ),
  );
  }

PreferredSizeWidget appBarWithIconWidget(Widget icon,String name){
  return AppBar(elevation: 0.0,leading: InkWell(onTap: (){
    Get.back();
  },child: icon),backgroundColor: ColorUtil.allayya_background,
    title: Text(name,style: TextStyle(color: Colors.black),),
    centerTitle: true,

  );
}

PreferredSizeWidget appBarWithoutIconWidget(String name,TextStyle style){
  return AppBar(elevation: 0.0,backgroundColor: ColorUtil.allayya_background,automaticallyImplyLeading: false,
    title: Text(name,style: style,),
    centerTitle: true,

  );
}