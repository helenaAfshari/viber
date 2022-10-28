

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      ),
    );
  }
}