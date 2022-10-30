

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/selected.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/constants/dimen.dart';
import 'package:viber_getx/view/calls_buttom_view/call_bottom_screen.dart';
import 'package:viber_getx/view/camera.dart';
import 'package:viber_getx/view/chat_button_screen.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key, 
  });
  final screen = [
 
  ];

  RxInt indexed = 0.obs;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
     child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: haSolidColors.colorIconBack),
      
        backgroundColor: haSolidColors.colorBackgroundAppBarChatScreen,
        title:Column(
          children: [
           Padding(
             padding: const EdgeInsets.only(right: 90),
             child: Text("name",style: haTextStyle.nameChatScreen,),
           ),
           Text("Last Seen on octobr 10",style: haTextStyle.lastSeenChatScreen,),
          ],
        ),
          actions: [
  
            Icon(Icons.call,color: haSolidColors.colorIconPhone,),
            const SizedBox(width: 20,),
            Icon(Icons.video_call_outlined,color: haSolidColors.colorIconVideoCall,),
            const SizedBox(width: 20,),
            Icon(Icons.menu,color: haSolidColors.colorMenu,),
            const SizedBox(width: 5,),
        
          ],
      ),
         body: 
         SingleChildScrollView(
           child: Stack(
            children: [
              Positioned.fill(
                child: Obx(
                  () =>  IndexedStack(
                   index: indexed.value,
                   children:[
                      
                   ]
                
                 ),
                )),
            
             const Padding(
            padding: EdgeInsets.only(top: 551),
            child: TextField(
               obscureText: false,
           
               cursorColor: Colors.black,
               decoration: InputDecoration(
            hintText: "Type a Message.....",
            isDense: true,
            enabledBorder:
             
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
               )),
                 ),
               
               myBottomBar(),
           
            ],
                 
           ),
         ),
         

         
      )
      );
  }
}

class myBottomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(top: 585),
       child: Row(
         children: [
           const SizedBox(width: 5,),
           IconButton(
             onPressed: () {
             bottomSheetsEmoji();
           }, icon: Icon(Icons.emoji_emotions)),
              
              IconButton(
             onPressed: () {
             
           }, icon: Icon(Icons.image)),
          
            IconButton(
             onPressed: () {
             
           }, icon: Icon(Icons.camera_alt_outlined)),

            IconButton(
             onPressed: () {
             
           }, icon: Icon(CupertinoIcons.gift_fill)),

            IconButton(
             onPressed: () {
             
           }, icon: Icon(CupertinoIcons.time)),
            IconButton(
             onPressed: () {
             
           }, icon: Icon(Icons.menu_sharp)),

       ]),
     );
  }


}

void bottomSheetsEmoji(){
   Get.bottomSheet(
    Scaffold(
     
    ),
   );

}
