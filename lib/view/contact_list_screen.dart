
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/input_decoration.dart';
import 'package:viber_getx/component/text_style.dart';
import 'package:viber_getx/component/widgets.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/controller/user_contact_controller.dart';
import 'package:viber_getx/controller/user_inbox_list_controller%20.dart';



class ContactListScreen extends StatelessWidget {
    ContactListScreen({super.key});

      var userContactController = Get.find<UserContactController>();
       UserInboxListController userInboxListController = Get.put(UserInboxListController());

        RxInt editIndex = 0.obs;
      
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: haSolidColors.badg),
          backgroundColor: haSolidColors.backgroundBottomContact,
           title: Text("New Chat"),
           
        ),
           body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
             child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: TextFormField(
                      onChanged: (value) => userContactController.searchContact(value),
                    decoration: haInputDecoration(hintText: "Search",icon: Icons.search).searchForms(),
                  
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                  
                    decoration: haInputDecoration(hintText: "user Name and Last Name",icon:Icons.edit).userNameInputeDecoration(),
                    controller: userContactController.userTextEditingController,
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: haInputDecoration(hintText: "phone",icon: Icons.phone).phoneInputeDecoration(),
                    controller: userContactController.phoneTextEditingController ,
                    ),
                ),
                
                SizedBox(
                  child: Obx(
                    (() =>  ListView.builder(
                      
                      shrinkWrap: true,
                      itemCount: userContactController.contactList.length,
                      itemBuilder: (context, index) {
                       return GestureDetector(
                                                
                           onTap: () {
                                 
                                // Get.to(ChatScreen());
                               userContactController.phoneTextEditingController.text = 
                               userContactController.contactList[index].phone;
                                userContactController.userTextEditingController.text =
                                 userContactController.contactList[index].name;
                                editIndex = index.obs;
                           },
                     

                          //TODO image path and hard cod
                         child:GestureDetector(
                          onTap: () {
                            userInboxListController.addToInbox(
                              name:  userContactController.contactList[index].name, 
                              phone:   userContactController.contactList[index].phone);
                              Get.back();
                          },
                           child: userItem(index: index, 
                           name: userContactController.contactList[index].name, 
                           imagePath: "", 
                           lastMessage: "lastMessage", 
                           time: "22:00"),
                         )
                       );
                    },
                  ))),
                ),
              ],
             ),
           ),
           bottomNavigationBar: Container(
            color: haSolidColors.backgroundBottomContact,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                  onPressed: () {
                  userContactController.addContact(); 
                }, child:  Text("Add Contact",style: haTextStyle.lightTextButton,)),
                SizedBox(width: 100,),
                 TextButton(
                  onPressed: () {
                     userContactController.editContact(editIndex.value);
                }, child:  Text("Update Contact",style: haTextStyle.lightTextButton,)),
                ],
              ),
             
            ],),
           ),
    ));
  }

 
}