
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/constants/myString.dart';
import 'package:viber_getx/controller/contacts_controller.dart';
import 'package:viber_getx/controller/invite_viber_controller.dart';
import 'package:viber_getx/controller/url_in_project.dart';
import 'package:viber_getx/controller/user_inbox_list_controller%20.dart';
import 'package:viber_getx/gen/assets.gen.dart';

import '../../main.dart';


class CalsBottomScreen extends StatefulWidget {
  const CalsBottomScreen({
    super.key,
  });

  @override
  State<CalsBottomScreen> createState() => _CalsBottomScreenState();
}

class _CalsBottomScreenState extends State<CalsBottomScreen> {
  RxInt selectedIndex = 0.obs;
  UserInboxListController userInboxListController =
      Get.put(UserInboxListController());
     UrlProject urlProject = Get.put(UrlProject());
       
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
                      Text(MyString.titleViberText, style: haTextStyle.nameViberStyle),
                      Padding(
                        padding: const EdgeInsets.only(left: 199),
                        child: Icon(
                          Icons.contact_page_sharp,
                          color: haSolidColors.colorIconcontact,
                        ),
                      ),
                      Icon(
                        Icons.search_outlined,
                        color: haSolidColors.colorIconSearch,
                      ),
                    ]),
                backgroundColor: haSolidColors.colorBackgroundAppBarNestedd,
                pinned: true,
                floating: true,
                expandedHeight: 100,
                bottom: TabBar(
                  tabs: [
                    Container(
                      height: 45,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: haSolidColors.colorBackgroundViberOut,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:haSolidColors.colorIconCallsNested,
                            ),
                            child: const Center(
                              child: Icon(Icons.call),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                            height: 3,
                          ),
                          Column(
                            children: [
                                //Text not OverFlow
                               Expanded(
                                child: Text(MyString.viberOutText,
                              style: haTextStyle.myNoteTextStyle,
                            softWrap: false,
                            overflow: TextOverflow.visible,)),
                              Text(
                                MyString.messageViberOutText,
                                maxLines: 2,
                                style: haTextStyle.massegeViberOutTextStyle,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Container(
                            width: 65,
                            height: 23,
                            decoration: BoxDecoration(
                              color:haSolidColors.colorBuyCredit,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text(
                              "BuyCredit",
                              style:haTextStyle. massegeViberOutTextStyle,
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
                        style: haTextStyle.recentCallStyle,
                      ),
                      const SizedBox(width: 205,),
                      TextButton(
                        onPressed: () {
                       //Get.toNamed(RouteCallsInViewAllRecentCalls);
                      }, child:  Text("View All",
                      style: TextStyle(color: haSolidColors.textColorViewAll),))
                    ],
                  ),

                  const recentCallsList(),

                  //Invite To Viber
                  //TODO Add Controller Invite toViber list

                  const SizedBox(
                    height: 12,
                  ),

                  inviteToViber(),

                  //Contact
                  //TODO Add Controller Contacts
                  const SizedBox(
                    height: 15,
                  ),

                  contactList(selectedIndex: selectedIndex),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            urlProject.makingPhoneCalls();
          },
          backgroundColor: haSolidColors.backgroundColorFloatingAction,
          child: const Icon(Icons.contact_phone_rounded),
        ),
      ),
    );
  }
}

class recentCallsList extends StatelessWidget {
  const recentCallsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                              )
                            ],
                          ),
                          SizedBox(
                            width: Get.width / 2,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration:const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.call),
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
    );
  }
}

class contactList extends StatelessWidget {
  const contactList({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final RxInt selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Contact",
              style: haTextStyle.contactTextStyle,
            ),
           
           contactTabView(),
          ],
        ),
        //change list 
         Obx(
           () =>  IndexedStack(
                index: selectedIndex.value,
                children: [
                 allContacts(),
                   Container(
        height: Get.height,
        color: Color.fromARGB(255, 250, 250, 249),
        child: ListView.builder(
          
          physics: ClampingScrollPhysics(),

          itemCount: 2 ,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 15, left: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  Image.asset(Assets.images.avatar.path)
                                      .image),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      //not OverFlow Text
                      const Expanded(
                           child: Text("hhh",
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.visible,)),
                      const SizedBox(
                        width: 156,
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: 
                           BoxDecoration(
                            shape: BoxShape.circle,
                            color: haSolidColors.backgroundColorVideoCall,
                          ),
                          child: Icon(Icons.video_call_outlined,size: 20,),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: haSolidColors.backgroundColorCall,
                        ),
                        child: IconButton(
                            onPressed: () {

                            },
                            icon: const Icon(
                              Icons.call,
                              size: 15,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      )
                ],
              )
           
         ),
       
      ],
    );
  }

  Widget allContacts() {
    ContactsController contactsController = Get.put(ContactsController());
    return Container(
        height: Get.height,
        color: Color.fromARGB(255, 250, 250, 249),
        child: ListView.builder(
          
          physics: ClampingScrollPhysics(),

          itemCount: contactsController.contactList.length ,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  Image.asset(Assets.images.avatar.path)
                                      .image),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      //not OverFlow Text
                      Expanded(
                           child: Text(contactsController.contactList[index].name,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.visible,)),
                      const SizedBox(
                        width: 156,
                      ),
                      Container(
                        width: 65,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: haSolidColors.backgroundColorInviteContact,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:  Center(child: Text("invite",)),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: haSolidColors.backgroundColorCallsContact,
                        ),
                        child: IconButton(
                            onPressed: () {

                            },
                            icon: const Icon(
                              Icons.call,
                              size: 15,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      );
  }

  SizedBox contactTabView() {
    return SizedBox(
            height: 15,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: selectItem.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Obx(
                () => GestureDetector(
                  onTap: () {
                    selectedIndex.value = index;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      selectItem[index],
                      style: index == selectedIndex.value
                          ? haTextStyle.selectedItem
                          : haTextStyle.unSelectedItem,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

class inviteToViber extends StatelessWidget {
  InviteViberController inviteController = Get.put(InviteViberController());
  UrlProject urlProject = Get.put(UrlProject());
  
   inviteToViber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          width: 400,
          height: 100,
          color: haSolidColors.badg,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                //List in Invite To Viber
              Obx(
                () =>  ListView.builder(
                  shrinkWrap: true,
                   itemCount: inviteController.contactList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 25, left: 10),
                      //color background Row ListView invite to viber
                      child: Container(
                        width: 250,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius:  const BorderRadius.horizontal(
                              left: Radius.circular(9),
                              right: Radius.circular(9)),
                          color: haSolidColors.backgroundColoreInvite,
                        ),
                        //Row in ListView invite to viber
                        child:
                         Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: 30),
                              child: Container(
                                height: 30,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: haSolidColors.backgroundColormultiply),
                                child:  GestureDetector(
                                  onTap: () {
                                    inviteController.contactList.removeAt(index);
                                  },
                                  child:  const Icon(
                                    CupertinoIcons.multiply,
                                    size: 15,
                                  ),
                                ),
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
                                    image: AssetImage(Assets.images.avatar.path)),
                              ),
                            ),
                             const SizedBox(
                              width: 10,
                            ),
                            //not overFlow Text
                              Expanded(
                              child: Text(inviteController.contactList[index].name,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.visible,)),
                             
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                 height: 22,
                                 width: 70,
                                 
                                 child: ElevatedButton(
                                  onPressed: () {
                                    urlProject.makingSendSms();
                                   
                                 }, child:  Center(
                                  child: Text("invite",style: haTextStyle.inviteTextStyle,)
                                 
                                 ),
                                 style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                  backgroundColor: haSolidColors.backgroundColorInvite,
                                 ),
                                 ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
        const Text(
          "Invite TO VIBER",
          style: TextStyle(fontSize: 10),
        )
      ],
    );
  }
}

List<String> selectItem = ['All', 'Viber'];         
