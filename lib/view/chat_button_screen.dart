
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/component/widgets.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/constants/myString.dart';
import 'package:viber_getx/controller/user_inbox_list_controller%20.dart';
import 'package:viber_getx/gen/assets.gen.dart';

class ChatBottomScreen extends StatefulWidget {
  ChatBottomScreen({
    super.key,
  });

  @override
  State<ChatBottomScreen> createState() => _ChatBottomScreenState();
}

class _ChatBottomScreenState extends State<ChatBottomScreen> {
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
                      Text(MyString.titleViberText, style:haTextStyle. nameViberStyle),
                      Padding(
                        padding: const EdgeInsets.only(left: 199),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: haSolidColors.colorIconCamera,
                        ),
                      ),
                      Icon(
                        Icons.search_outlined,
                        color: haSolidColors.colorIconSearch,
                      ),
                    ]),
                backgroundColor: haSolidColors.colorBackgroundAppBarNestedd,
                pinned: false,
                floating: true,
                expandedHeight: 100,
                bottom: TabBar(tabs: [
                  Container(
                    height: 45,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: haSolidColors.colorBackgroundAppBarMyNote,
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
                              color: haSolidColors.backgroundColorCircularShape,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10,left: 5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(Assets.icons.tick.path),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(Assets.icons.line.path),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                    Row(
                                    children: [
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(Assets.icons.tick.path),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(Assets.icons.line.path),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ),
                           
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              MyString.myNoteText,
                              style: haTextStyle.myNoteTextStyle,
                            ),
                            Text(
                              MyString.messageText,
                              style: haTextStyle.massegeViberOutTextStyle,
                            )
                          ],
                        ),
                             Padding(
                    padding: const EdgeInsets.only(left: 148),
                    child: Column(
                      children: [
                        Row(

                          children: [
                            // Text("date",style: TextStyle(color: unselectedBottomBar),),

                                Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(

                                            image: AssetImage(Assets.icons.doubleTick.path),
                                          ),
                                        ),
                                       ),
                                       Text("12:17 pm",style: TextStyle(fontSize: 11,color: Colors.black38),),

                          ],
                        ),
                          Container(
                                        height: Get.height/50,
                                        width: Get.width/6,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(

                                            image: AssetImage(Assets.icons.pined.path),
                                          ),
                                        ),
                                       ),
                      ],
                    ),
                  ),
                      ],
                    ),
                  ),
                ],
                ),
              ),
            ],
            body: Padding(
              padding: const EdgeInsets.only(top: 25, left: 10),
              //List Page in Chat
              child: //Obx(
                  SizedBox(
                child: Obx((() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: userInboxListController.inboxList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              //  Get.to(ChatScreen());

                              //  userContactController.phoneTextEditingController.text = userContactController.contactList[index].phone;
                              //  userContactController.userTextEditingController.text = userContactController.contactList[index].name;
                              //  editIndex = index;
                            },

                            //TODO image path and hard cod
                            child: userItem(
                                index: index,
                                name: userInboxListController
                                    .inboxList[index].name,
                                imagePath: "",
                                lastMessage: "lastMessage",
                                time: "22:00"));
                      },
                    ))),
              ),
            ),
          ),
        ),
             floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/ContactListScreen');
          },
          backgroundColor: haSolidColors.backgroundColorFloatingAction,
          child: Icon(Icons.message_outlined),

        ),
      ),
    );
      
    

    //     floatingActionButton: FloatingActionButton(
    //       onPressed: () {
    //         Get.toNamed('/ContactListScreen');
    //       },
    //       backgroundColor: colorFloatingAction,
    //       child: Icon(Icons.message_outlined),

    //     ),
    //     bottomNavigationBar: BottomBar(),
    //   ),
    // );
  }
}
