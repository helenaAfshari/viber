
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/constants/myString.dart';
import 'package:viber_getx/controller/invite_viber_controller.dart';
import 'package:viber_getx/controller/make_phone_calls_controller.dart';
import 'package:viber_getx/controller/user_inbox_list_controller%20.dart';
import 'package:viber_getx/gen/assets.gen.dart';


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
                              color: colorAppBarNested,
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
                              style: myNoteTextStyle,
                            softWrap: false,
                            overflow: TextOverflow.visible,)),
                              Text(
                                MyString.messageViberOutText,
                                maxLines: 2,
                                style: massegeViberOutTextStyle,
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
            makingPhoneCalls();
          },
          backgroundColor: colorFloatingAction,
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
              style: contactTextStyle,
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
                    color: Colors.blue,
                  height: 50,
                  width: 20,),
                ],
              )
           
         ),
       
      ],
    );
  }

  Container allContacts() {
    return Container(
        height: Get.height,
        color: Color.fromARGB(255, 250, 250, 249),
        child: ListView.builder(
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
                      const Text("name"),
                      const SizedBox(
                        width: 156,
                      ),
                      Container(
                        width: 65,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: unselectedBottomBar,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(child: Text("invite")),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: unselectedBottomBar,
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
                          ? selectedItem
                          : unSelectedItem,
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
          color: badg,
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
                      padding: EdgeInsets.only(top: 25, bottom: 25, left: 10),
                      //color background Row ListView invite to viber
                      child: Container(
                        width: 260,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.horizontal(
                              left: Radius.circular(9),
                              right: Radius.circular(9)),
                          color: colorBackgroundBottomBar,
                        ),
                        //Row in ListView invite to viber
                        child:
                         Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: 30),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: unselectedBottomBar),
                                child: const Icon(
                                  CupertinoIcons.multiply,
                                  size: 15,
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
                             const Expanded(
                              child: Text("Amir Hosein",
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.visible,)),
                              
                             const SizedBox(
                              width: 66,
                            ),
                            Container(
                              width: 60,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: colorActionAppbar,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "Invite",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: lightScafoldBackgroundColor),
                              )),
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
