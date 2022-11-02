

import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/input_decoration.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/constants/color_viber.dart';


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
        
          // Stack(
          //   children: [
          //     Positioned(
          //       bottom: 0.5,
          //       child: Column(
          //       children: [
          //          Container(
          //       height: Get.height/7,
          //       width: Get.width,
          //       color: Colors.red,
          //       child: 
          //       Column(
          //         children: [
          //           TextField(
          //             decoration: haInputDecoration.typeMessageInChatScreen("Type Message"),),
          //               myBottomBar(),
          //         ],
          //       ),
                  
          //          ),
          //       ],
          //         ) ,
          //       ),
      
          //   ],
              
          // ),
          Stack(
            children: [
              Positioned(
                bottom: 0.5,
                child: Column(
                children: [
                   Container(
                height: Get.height/7,
                width: Get.width,
                color: Colors.red,
                child: 
                Column(
                  children: [
                    TextField(
                      decoration: haInputDecoration.typeMessageInChatScreen("Type Message"),),
                        myBottomBar(),
                  ],
                ),
                  
                   ),
                ],
                  ) ,
                ),
      
            ],
              
          )
        
          
          ),
     
    );
  }
}

class myBottomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Row(
       children: [
        
         IconButton(
           onPressed: () {
        
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

     ]);
  }


}



