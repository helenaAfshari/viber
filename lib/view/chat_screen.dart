

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/selected.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/constants/color_viber.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
           TextFormField(
     
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: "Type a Message.....",
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    ),
        //   Padding(
        //     padding: const EdgeInsets.only(top: 655),
        //     child: Container(
        //        height: 55,
        //        width: Get.width,
        //        color: Colors.amber,
               
        //  ),
        //   ),
         ),
      
      );
  }
}