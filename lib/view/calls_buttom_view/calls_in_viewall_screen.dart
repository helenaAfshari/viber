
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/text_style.dart';
import '../../constants/color_viber.dart';
import '../../gen/assets.gen.dart';

class CallsInViewAllRecentCalls extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(   
      appBar: AppBar(
        backgroundColor:haSolidColors. colorBackgroundAppBarViewAll,
        leading:
           
           IconButton(
            onPressed: () {
              Get.back();
            },
            icon:Icon(CupertinoIcons.back),color: haSolidColors.colorIconBack, 
            ),
        
        title: Text("Calls",style:haTextStyle. callsTextStyle,),
        actions: [
          Icon(CupertinoIcons.search,color: haSolidColors.colorIconSearch,),
        ],
        ),

      body:
       SingleChildScrollView(
         child: Column(
            children: [
                 SizedBox(
                  height: Get.height,
                  width: Get.width,
                   child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                     return Row(
                children: [
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 248, 246, 246),
                    width: Get.width / 1,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(Assets.images.avatar.path)),
                              ),
                            ),
                            Column(
                              children: [
                                const Text("name"),
                                Row(
                                  children:const [
                                     Icon(
                                      Icons.call_made_rounded,
                                      size: 13,
                                    ),
                                    Text("audioCall"),
                                  ],
                                ),
                                
                              ],
                            ),
                            
                            SizedBox(width: Get.width/2.4,),
                            const Expanded(
                              child:
                              //date
                              Text("10/5/22",
                              overflow: TextOverflow.visible,
                              softWrap: false,
                              maxLines: 1,

                              ) ),
                      
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration:const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.call),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
                    }, ),
                 ),
              
            ],
          ),
       ),
  
        
        ),
        );

  }


}
