import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/bottom_bar.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/component/widgets.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/constants/myString.dart';
import 'package:viber_getx/controller/user_inbox_list_controller%20.dart';
import 'package:viber_getx/gen/assets.gen.dart';

class CalsBottomScreen extends StatefulWidget {
  CalsBottomScreen({
    super.key,
  });

  @override
  State<CalsBottomScreen> createState() => _CalsBottomScreenState();
}

class _CalsBottomScreenState extends State<CalsBottomScreen> {
  UserInboxListController userInboxListController =
      Get.put(UserInboxListController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: DefaultTabController(
          length: 1,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(MyString.titleViberText, style: nameViberStyle),
                      Padding(
                        padding: const EdgeInsets.only(left: 199),
                        child: Icon(
                          Icons.contact_page_sharp,
                          color: colorActionAppbar,
                        ),
                      ),
                      Icon(
                        Icons.search_outlined,
                        color: colorActionAppbar,
                      ),
                    ]),
                backgroundColor: colorBackgroundAppBar,
                pinned: true,
                floating: true,
                expandedHeight: 100,
                bottom: TabBar(
                  tabs: [
                    Container(
                      height: 45,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: colorBackgroundAppBarNested,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorAppBarNested,
                            ),
                            child: Center(
                              child: Icon(Icons.call),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                            height: 2,
                          ),
                          Column(
                            children: [
                              Text(
                                MyString.viberOutText,
                                style: myNoteTextStyle,
                              ),
                              Text(
                                MyString.messageViberOutText,
                                maxLines: 2,
                                style: massegeViberOutTextStyle,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Container(
                            width: 65,
                            height: 23,
                            decoration: BoxDecoration(
                              color: colorBuCredit,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text(
                              "BuyCredit",
                              style: massegeViberOutTextStyle,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],

            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "RECENT CALLS",
                        style: recentCallStyle,
                      ),
                      SizedBox(
                        width: Get.width / 1.7,
                      ),
                      Text(
                        "VIEW ALL",
                        style: viewAllStyle,
                      )
                    ],
                  ),

                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                color: Color.fromARGB(255, 248, 246, 246),
                                width: Get.width / 1.1,
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
                                                image: AssetImage(
                                                    Assets.images.avatar.path)),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text("name"),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.call_made_rounded,
                                                  size: 13,
                                                ),
                                                Text("audioCall"),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: Get.width / 2,
                                        ),
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(Icons.call),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                      
                      //Invite To Viber
                      //TODO Add Controller Invite toViber list
                    
                 SizedBox(height: 12,),

                  Stack(
                    children: [
                    
                     
                      Container(
                       
                        width: 400,
                        height: 100,
                        color: badg,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,

                          child: Row(
                          
                            children: [
                          
                            ListView.builder(
                              
                              shrinkWrap: true,
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:  EdgeInsets.only(
                                      top: 25, bottom: 25, left: 10),
                                  child: Container(
                                    width: 220,
                                    height: 20,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(9),
                                          right: Radius.circular(9)),
                                      color: colorBackgroundBottomBar,
                                    
                                    ),
                                    child:
                                    
                                       
                                         Row(
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: unselectedBottomBar
                                ),
                                child: Center(
                                  child: Icon(CupertinoIcons.multiply,size: 15,)),
                              ),
                                  ),
                                          
                                          const SizedBox(
                                            width: 11,
                                          ),
                                          Container(
                                            width: Get.width / 12,
                                            height: Get.height / 12,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      Assets.images.avatar.path)),
                                            ),
                                          ),
                                          
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          const Text(
                                            "name",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          Container(
                                            width: 60,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: colorActionAppbar,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                                child: Text(
                                              "Invite",
                                              style: TextStyle(fontSize: 10,color: lightScafoldBackgroundColor),
                                            )),
                                            
                                          ),
                                            
                        
                                        ],

                                       
                                      ),
                                       
                                  ),
                                  
                                );
                                
                              },
                            ),
                            
                             
                          ]
                          ),
                        ),
                        
                      ),
                      Text("Invite TO VIBER",style: TextStyle(fontSize: 10),)
                  
                    ],
                  ),


                  //Contact
                  //TODO Add Controller Contacts
                  SizedBox(height: 15,),
                  Stack(
                    children: [
                      Container(
                        height: Get.height/2,
                        width: Get.width,
                        color: Colors.red,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                      Text("Contacts"),
                                           SizedBox(width: 210,),
                                       Text("All"),
                                        Text("viber"),
                                      
                                 ],
                              ),
                              // ListView.builder(
                              //   shrinkWrap: true,
                              // itemCount: 1,
                              // scrollDirection: Axis.vertical,
                              //   itemBuilder: (context, index) {
                              //   return 
                              // },)
                            ],
                                
                          ),
                        ),

                      )
                    ],
                  )
                  
                ],
              ),
            ),

        
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: colorFloatingAction,
          child: Icon(Icons.contact_phone_rounded),
        ),
      ),
    );

  }
}
