
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viber_getx/component/text_style.dart';


import '../gen/assets.gen.dart';




Widget userItem(
    {
    required int index,
    required String name,
    required String imagePath,
    required String lastMessage,
    required String time,
    }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [  
          
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(Assets.images.avatar.path).image
                  ),
              )
             ),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style:haTextStyle.usernameTextStyle,),
                Text(lastMessage,style: haTextStyle.lastMassegeTextStyle,),
              ],
             ),
             
        ],
              
             ),
           
           Text(time,style: haTextStyle.dateTextStyle,),
          
        ],
      ),
    );
    
        //Text(userContactController.contactList[index].name),

  }


  Widget hlnSelectItem(){
      return Text("g");
      
    }
  










                          
       