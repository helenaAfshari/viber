

import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/input_decoration.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/constants/dimen.dart';
import 'package:viber_getx/gen/assets.gen.dart';

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
        
          Stack(
            children: [
              
                Container(
                color: Colors.white,
                ),
                 
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
              
          ),
            ]
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
        
         }, icon: const Icon(Icons.emoji_emotions)),
            
            IconButton(
           onPressed: () {
           
         }, icon: const Icon(Icons.image)),
        
          IconButton(
           onPressed: () {
           
         }, icon: const Icon(Icons.camera_alt_outlined)),

          IconButton(
           onPressed: () {
           BottomSheet();
         }, icon: const Icon(CupertinoIcons.gift_fill)),

          IconButton(
           onPressed: () {
           
         }, icon: const Icon(CupertinoIcons.time)),
          IconButton(
           onPressed: () {
           
         }, icon: const Icon(Icons.menu_sharp)),

     ]);
  }


}


 BottomSheet(){
  Get.bottomSheet(
     Container(
     
      decoration:const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
      ),
      
       child: Padding(
         padding: const EdgeInsets.all(17.0),
         child: Column(
          children: [
            const Icon(Icons.backspace_outlined),
            Row(
              children: [
                Container(
                  height: Get.height/6.5,
                  width: Get.width/1.1,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: Dimens.RecentTextInBottomSheetChat),
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
                                    child: Icon(Icons.star,size: 40,color: Colors.white,),
                                  
                                    ),
                                    
                                
                                ),
                                SizedBox(height: 4,),
                                 Text("Saved"),
                              ],
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 2, 90, 243),
                                  ),
                                  child:const Icon(Icons.location_pin,size: 40,color: Colors.white,),
                                ),
                                 SizedBox(height: 4,),
                                Text("Location")
                              ],
                            ),
                             const SizedBox(width: 5,),
                               Column(
                                 children: [
                                   Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 1, 8, 217),
                              ),
                              child: const Center(child: Icon(Icons.gif_sharp,size: 44,color: Colors.white,),),
                            ),
                             SizedBox(height: 4,),
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
                  )
                ),
              ],
            ),
           
                 const Padding(
                   padding: EdgeInsets.only(right: Dimens.RecentTextInBottomSheetChat),
                   child: Text("Extensions"),
                 ),
                  const SizedBox(height: 5,),
                      Container(
                       height: Get.height/4.1,
                       width: Get.width/1.1,
                       color: Colors.red,
                       
                         child: Column(
                          children: [
                         Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                         ),
                         
                         ),
                         const SizedBox(height: 10,),
                            Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                         ),
                         
                         ),
                         const SizedBox(height: 10,),
                            Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                         ),
                         
                         ),
                      
                           ],
                         ),
                      
                      )
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

enum MessageContentType{
   image,
   video,
   voice,
   text,
}

 

List Messages = [
   {
      'content':"hellooooo",
      'time':'05:40',
       'messageStatus':MessageStatus.read.name,
       'userId':1234,
   },
     {
      'content':"hellooooo",
      'time':'05:40',
       'messageStatus':MessageStatus.read.name,
       'userId':5678,
   },
     {
      'content':"hellooooo",
      'time':'05:40',
       'messageStatus':MessageStatus.read.name,
       'userId':1234,
   },
     {
      'content':"hellooooo",
      'time':'05:40',
       'messageStatus':MessageStatus.read.name,
       'userId':5678,
   },
     {
      'content':"hellooooo",
      'time':'05:40',
       'messageStatus':MessageStatus.read.name,
       'userId':1234,
   },
     {
      'content':"hellooooo",
      'time':'05:40',
       'messageStatus':MessageStatus.read.name,
       'userId':5678,
   },

];







