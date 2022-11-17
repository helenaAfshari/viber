
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/input_decoration.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/constants/dimen.dart';
import 'package:viber_getx/controller/chat_box_controller/emoji_controller.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:viber_getx/controller/chat_box_controller/gallery_controller.dart';
import 'package:viber_getx/controller/chat_box_controller/menu_controller.dart';
import 'package:viber_getx/controller/chat_box_controller/picker_file_controller.dart';
import 'package:viber_getx/services/pick_file.dart';
class ChatScreen extends StatelessWidget {
  EmojiPickerControllerr controller = Get.put(EmojiPickerControllerr());
  FilePickerController filePickerController = Get.put(FilePickerController());
  MenuControllerr menuControllerr = Get.put(MenuControllerr());
  GalleryController galleryController = Get.put(GalleryController());
  
  ChatScreen({
    super.key,
  });
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
              padding: const EdgeInsets.only(right:Dimens.normal+58),
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
            width: Dimens.large-3,
          ),
          Icon(
            Icons.video_call_outlined,
            color: haSolidColors.colorIconVideoCall,
          ),
          const SizedBox(
            width: Dimens.large-3,
          ),
          Icon(
            Icons.menu,
            color: haSolidColors.colorMenu,
          ),
          const SizedBox(
            width: Dimens.large-10,
          ),
        ],
      ),
      body:
          //Message list
         
          Column(
            children: [
              Expanded(
                child: Container(
                  color: haSolidColors.lightScafoldBackgroundColor,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
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
            
                 boxChatTextField(),
                 emojiPicker(),
                 pickFilee(),
                 menuSharp(),
                 
         
            ],
          ),
        
      
    ));
  }
  
//emojiPicker
  Widget emojiPicker() {
    return Column(
      children: [
        Obx(
          () => Offstage(
            offstage: !controller.isEmojiVisible.value,
            child: SizedBox(
              height: Dimens.xlarge*8,

              child: EmojiPicker(
                onEmojiSelected: (category, emoji) {
                  //when select emoji in show text in textEditing
                  controller.textEditingController.text =
                      controller.textEditingController.text + emoji.emoji;
                    
                },
                onBackspacePressed: () {},
                config: const Config(
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
                  gridPadding: EdgeInsets.only(left: Dimens.smal, right: Dimens.smal),
                  enableSkinTones: true,
                  categoryIcons: CategoryIcons(),
                  buttonMode: ButtonMode.CUPERTINO,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }


//pickFile
 Widget  pickFilee(){
  //TODO condision open filePicker or ImagePicker  where show image or textEditing
  return
   Column(
      children: [
        Obx(
          () => Offstage(
            offstage: !galleryController.isGalleryVisible.value,
            child: SizedBox(    
              height: Dimens.xlarge*8,
              child:  GridView.builder(               
                itemCount:2, 
                shrinkWrap: true,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  childAspectRatio: 1
                ) , 
                itemBuilder:(context, index) {
                  return Container(
                    color: Colors.blue,
                    width: Dimens.xlarge,  
                    child:  
                    filePickerController.file.value.name=='nothing'?
                    const Text("data"):Image.file(File(filePickerController.file.value.path!)),
                   );
                }),
      
            ),
          ),
        )
      ],
    );
  }

  Widget boxChatTextField() {
    return Container(
      height: Get.height / 7,
      width: Get.width,
      color: Colors.white,
      child: Column(
        children: [
          TextField(
            focusNode: controller.focusNode,
            controller: controller.textEditingController,
            decoration:
                haInputDecoration.typeMessageInChatScreen("Type Message"),
          ),
          iconsInBottomBar(controller: controller,menuControllerr: menuControllerr,gallery: galleryController),
        ],
      ),
    );
  }
   
   //menu
   Widget menuSharp(){
    return Column(
           children: [
            Obx(
              () => Offstage(
                offstage: !menuControllerr.isMenu.value,
                 
                child: Container(
                  height: Dimens.xlarge*8,
                  width: double.infinity,
                  color: haSolidColors.backgroundColorCall,
                  child: 
                  Padding(
                    padding: const EdgeInsets.all(Dimens.smal),
                    child: Column(
                      children: [
                        Row(
                          children:const [
                            Icon(Icons.contact_page_outlined),
                             
                            Text("Share Contact"),
                          ],
                        ),
                        const SizedBox(height: Dimens.normal,),
                        Row(children:const [
                          Icon(Icons.location_pin),
                          Text("Send Location"),
                        ],),
                      ],
                    ),
                  ),
                ),
              ),
            ),
           ],
    );
    
}
  

  Widget outputMessage(String msg) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Dimens.xlarge * 2,
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
        Dimens.xlarge * 2,
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

//ButtonIconsInChatBox
class iconsInBottomBar extends StatelessWidget {
  final EmojiPickerControllerr controller;
   final MenuControllerr menuControllerr;
   final GalleryController gallery;
  const iconsInBottomBar({
    required this.controller,
     required this.menuControllerr,
     required this.gallery,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      //emojiPicker
      IconButton(
          onPressed: () {
            controller.isEmojiVisible.value = !controller.isEmojiVisible.value;
            controller.focusNode.unfocus();
            controller.focusNode.canRequestFocus = true;
          },
          icon: const Icon(Icons.emoji_emotions)),
      IconButton(onPressed: () {
          gallery.isGalleryVisible.value = !gallery.isGalleryVisible.value;
             //pickFile
             pickFile();
      }, icon: const Icon(Icons.image)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
      IconButton(
          onPressed: () {
            BottomSheet();
          },
          icon: const Icon(CupertinoIcons.gift_fill)),
      IconButton(onPressed: () {
        menuControllerr.isMenu.value = !menuControllerr.isMenu.value;
         
      }, icon: const Icon(Icons.menu_sharp)),
    ]);
  }
}




//BottomSheet in ChatBox
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
            const Icon(
              Icons.backspace_outlined,
              size: Dimens.normal,
            ),
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
                         
                              right: Dimens.xlarge*9.1),
                          child: Text("Recents"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Dimens.smal),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: Dimens.xlarge+18,
                                    width: Dimens.xlarge+18,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.star,
                                        size: Dimens.xlarge*1,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Dimens.smal,
                                  ),
                                  const Text("Saved"),
                                ],
                              ),
                              const SizedBox(
                                width: Dimens.smal-2,
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: Dimens.xlarge+18,
                                    width: Dimens.xlarge+18,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 2, 90, 243),
                                    ),
                                    child: const Icon(
                                      Icons.location_pin,
                                      size: Dimens.xlarge*1,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Dimens.smal,
                                  ),
                                  const Text("Location")
                                ],
                              ),
                              const SizedBox(
                                width: Dimens.smal-2,
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: Dimens.xlarge+18,
                                    width: Dimens.xlarge+18,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 1, 8, 217),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.gif_sharp,
                                        size: Dimens.xlarge*1.1,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height:Dimens.smal-2,
                                  ),
                                  const Text("Tenor")
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: Dimens.smal/9,
                          indent: Dimens.smal/8,
                          endIndent: Dimens.smal/8,
                          color: Colors.black,
                        ),
                      ],
                    )),
              ],
            ),
            const Padding(
              padding:
                  EdgeInsets.only(right:Dimens.xlarge*9.1 ),
              child: Text("Extensions"),
            ),
            const SizedBox(
              height: Dimens.smal+2,
            ),
            Row(
              children: [
                Container(
                  height: Dimens.xlarge+18,
                  width: Dimens.xlarge+18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: haSolidColors.colorGif,
                  ),
                  child: const Icon(
                    Icons.gif_box,
                    color: Colors.white,
                    size: Dimens.xlarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: Dimens.smal),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: Dimens.smal * 2.2),
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
                    height: Dimens.xlarge+18,
                    width: Dimens.xlarge+18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: haSolidColors.colorGames,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(Dimens.normal-1),
                      child: Icon(
                        Icons.r_mobiledata,
                        size: Dimens.xlarge * 1.2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: Dimens.smal),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: Dimens.xlarge+35),
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
                    height: Dimens.xlarge+18,
                    width: Dimens.xlarge+18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: haSolidColors.colorLoveSticker,
                    ),
                    child: const Icon(Icons.heart_broken_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:  Dimens.smal),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right:Dimens.xlarge+20),
                          child: Text("Share your love with sticker"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Dimens.large+12),
                          child: Text("Search Thousands of sticker"),
                        ),
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
];
