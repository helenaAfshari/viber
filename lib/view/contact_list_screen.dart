
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/component/widgets.dart';
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
           body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
             child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "userName"),
                  controller: userContactController.userTextEditingController,
                  ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "phone"),
                  controller: userContactController.phoneTextEditingController ,
                  ),
                ElevatedButton(
                  onPressed: () {
                  userContactController.addContact(); 
                }, child: const Text("Add Contact")),
                 ElevatedButton(
                  onPressed: () {

                     userContactController.editContact(editIndex.value);


                }, child: const Text("Update")),
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
    ));
  }

 
}