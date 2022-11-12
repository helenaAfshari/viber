import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:viber_getx/component/input_decoration.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/constants/dimen.dart';
import 'package:viber_getx/controller/emoji_controller.dart';
import 'package:viber_getx/gen/assets.gen.dart';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:viber_getx/view/emoji_screen.dart';
class ChatScreen extends StatelessWidget {
  EmojiPickerControllerr controller =Get.put(EmojiPickerControllerr());
  ChatScreen({
    super.key,
  });
  final screen = [];
  //TODO test and later get from hive
  var myPhone = 1234;
   
  RxInt indexed = 0.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //AppBar
        appBar: AppBar(
          iconTheme: IconThemeData(color: haSolidColors.colorIconBack),
          backgroundColor: haSolidColors.colorBackgroundAppBarChatScreen,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 90),
                child: Text(
                  "name",
                  style: haTextStyle.nameChatScreen,
                ),
              ),
              Text(
                "Last Seen on octobr 10",
                style: haTextStyle.lastSeenChatScreen,
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.call,
              color: haSolidColors.colorIconPhone,
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.video_call_outlined,
              color: haSolidColors.colorIconVideoCall,
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.menu,
              color: haSolidColors.colorMenu,
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        body:
        //Message list
         Stack(
          children: [
          Column(
            children: [
              Expanded(
                child: SizedBox(
                  
                  width: Get.width,
                  child: Container(
                    color: haSolidColors.lightScafoldBackgroundColor,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: Messages.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Messages[index]['userId'] == myPhone
                            ? outputMessage(Messages[index]['content'])
                            : inputMessage(Messages[index]['content']);
                      },
                    ),
                  ),
                ),
              ),
              Obx(
              ()=> Offstage(
                offstage: !controller.isEmojiVisible.value,
                child: SizedBox(
                  height: 240,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                     //when select emoji in show text in textEditing
                      controller.textEditingController.text=controller.textEditingController.text+emoji.emoji;
                    },
                    onBackspacePressed: () {
                      
                    },
                    config:  const Config(
                      columns: 7,
                      verticalSpacing: 0,
                      horizontalSpacing: 2,
                      initCategory: Category.SMILEYS,
                      emojiSizeMax: 26,
                      bgColor: Color.fromARGB(255, 190, 218, 235),
                      indicatorColor: Color.fromARGB(255, 4, 30, 53),
                      iconColor: Colors.grey,
                      iconColorSelected: Color.fromARGB(255, 4, 62, 109),
                      showRecentsTab: true,
                      recentsLimit: 5,
                       gridPadding: EdgeInsets.only(left: 10,right: 10),
                    enableSkinTones: true,
                      categoryIcons: CategoryIcons(),
                      buttonMode: ButtonMode.CUPERTINO,
            
                    ),
                  ),
                ),
              ),
            ),
            ],
          ),
          //Type Message Chat Box
          Stack(
            children: [
              Positioned(
                bottom: 0.5,
                child: Column(

                  children: [
                    Container(
                      height: Get.height / 7,
                      width: Get.width,
                      color: Colors.white,
                      child: Column(
                        children: [
                          TextField(
                            decoration: haInputDecoration
                                .typeMessageInChatScreen("Type Message"),
                          ),
                          myBottomBar(controller: controller,),
                        ],
                      ),
                    ),
                        
                       
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget outputMessage(String msg) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Dimens.xlarge*2,
        Dimens.normal,
        Dimens.normal,
        0,
      ),
      child: Container(
        
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.normal),
            bottomRight: Radius.circular(Dimens.normal),
            topLeft: Radius.circular(Dimens.normal),
            topRight: Radius.circular(0),
          ),
          color: haSolidColors.messageColor,
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(msg),
        ),
      ),
    );
  }

    Widget inputMessage(String msg) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
      
        Dimens.normal,
        Dimens.normal,
          Dimens.xlarge*2,
        0,
      ),
      child: Container(
        
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.normal),
            bottomRight: Radius.circular(Dimens.normal),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(Dimens.normal),
          ),
          color: haSolidColors.messageColor,
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(msg),
        ),
      ),
    );
  }
}

class myBottomBar extends StatelessWidget {
  EmojiPickerControllerr controller = EmojiPickerControllerr();

  myBottomBar({
   required this.controller,
    super.key,
    });
  
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(onPressed: () {
      
        controller.isEmojiVisible.value=!controller.isEmojiVisible.value;
      controller.focusNode.unfocus();
      controller.focusNode.canRequestFocus=true;


      }, icon: const Icon(Icons.emoji_emotions)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.image)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
      IconButton(
          onPressed: () {
            BottomSheet();
          },
          icon: const Icon(CupertinoIcons.gift_fill)),
      IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.time)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.menu_sharp)),
    ]);
  }
}

addEmojiPicker(){
             Offstage(
                 offstage: false,
               child: EmojiPicker(
              onEmojiSelected:(category, emoji) {
      
               },
                  onBackspacePressed: () {
      
                    },
                   config: const Config(
                          columns: 7,
                          verticalSpacing: 0,
                          horizontalSpacing: 0,
                          initCategory: Category.SMILEYS,
                          bgColor: Colors.red,
                          indicatorColor: Colors.blue,
                          iconColor: Colors.grey,
                          iconColorSelected: Colors.blue,
                          showRecentsTab: true,
                          recentsLimit: 28,
                          //noRecentStyle and Text
                          tabIndicatorAnimDuration: kTabScrollDuration,
                          categoryIcons: CategoryIcons(),
                          buttonMode: ButtonMode.MATERIAL,
                          

    ),
     ),
);

}






BottomSheet() {
  Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            const Icon(Icons.backspace_outlined,size: 15,),
            Row(
              children: [
                Container(
                    height: Get.height / 6.5,
                    width: Get.width / 1.1,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              right: Dimens.RecentTextInBottomSheetChat),
                          child: Text("Recents"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.star,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text("Saved"),
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 2, 90, 243),
                                    ),
                                    child: const Icon(
                                      Icons.location_pin,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text("Location")
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 1, 8, 217),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.gif_sharp,
                                        size: 44,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text("Tenor")
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          indent: 2,
                          endIndent: 6,
                          color: Colors.black,
                        ),
                      ],
                    )),
              ],
            ),
            const Padding(
              padding:
                  EdgeInsets.only(right: Dimens.RecentTextInBottomSheetChat),
              child: Text("Extensions"),
            ),
            const SizedBox(
              height: 10,
            ),
                 
            Row(
              children: [
                Container(
                    height: 50,
                          width: 50,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: haSolidColors.colorGif,
                ),
                child: Icon(Icons.gif_box,color: Colors.white,size: Dimens.xlarge,),
                ),
              Padding(
                padding: const EdgeInsets.only(left: Dimens.smal),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: Dimens.smal*2.2),
                      child: Text("Create your own Gif"),
                    ),
                    Text("Turn any video into aGif"),

                  ],
                ),
              ),
              ],
            ),

                Padding(
                  padding: const EdgeInsets.only(top: Dimens.normal),
                  child: Row(
              children: [
                  Container(
                      height: 50,
                            width: 50,
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: haSolidColors.colorGames,
                  ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.r_mobiledata,size: Dimens.xlarge*1.2,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: Dimens.smal),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 65),
                          child: Text("Games"),
                        ),
                        Text("Search for games"),
                      ],
                    ),
                  )
              ],
            ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: Dimens.normal),
                  child: Row(
              children: [
                  Container(
                      height: 50,
                            width: 50,
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: haSolidColors.colorLoveSticker,
                  ),
                  child: Icon(Icons.heart_broken_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text("Share your lov with sticker"),
                        ),
                        Text("Search Thousands of sticker"),
                      ],
                    ),
                  )
              ],
            ),
                ),
          
    
          ],
        ),
      ),
    ),
  );
}



enum MessageStatus {
  delivered,
  deliveredUserOfline,
  deliveredUserOnline,
  read,
}

enum MessageContentType {
  image,
  video,
  voice,
  text,
}

List Messages = [
  {
    'content': "hellooooo",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
  },
  {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
  {
    'content': "hellooooo",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
  },
  {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
  {
    'content': "hellooooo",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
  },
  {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
    {
    'content': "How do you know",
    'time': '05:40',
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
  },
];
