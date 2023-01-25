

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:viber_getx/constants/hive_keys.dart';
import 'package:viber_getx/model/user_contact_list_model.dart';

class UserContactController extends GetxController{

     TextEditingController userTextEditingController = TextEditingController();
     TextEditingController phoneTextEditingController = TextEditingController();

     RxList<UserContactListModel>contactList = RxList();
     RxList<UserContactListModel> contact = RxList();
      
      @override
       void onInit()async{
        super.onInit();
       await readContact();
       }
       
     addContact()async{
                  
               //add user to box
          var box = await Hive.openBox(HiveFieldConstants.userContactListBox);
          var user =  UserContactListModel(
            name: userTextEditingController.text,
            phone:phoneTextEditingController.text ,
            profileUser: "user profile",);
           box.add(user);
           
             contactList.clear();

          //read user from box
          box.values.forEach((element) {
              UserContactListModel userContactListModel = element;
              contactList.add(userContactListModel);
              print(userContactListModel.name);
              
          });

     }
  


     readContact()async{
          var box =await Hive.openBox(HiveFieldConstants.userContactListBox);
         box.values.forEach((element) {
           UserContactListModel userContactListModel = element;
           contactList.add(userContactListModel);
           print(userContactListModel);
          
         }
         
         );
     }

    

     editContact(int index)async{
         var box = await Hive.openBox(HiveFieldConstants.userContactListBox);
         UserContactListModel userContactListModel = box.getAt(index);
         userContactListModel.name = userTextEditingController.text;
         userContactListModel.phone = phoneTextEditingController.text;
         userContactListModel.save();
               
         contactList.clear();
            
          //read user from box
         readContact();
          
     }

      edit(int index)async{
          var box = await Hive.openBox(HiveFieldConstants.userContactListBox);
          UserContactListModel userContactListModel = box.getAt(index);
          
      }

     searchContact(String searchKey)async{
        contactList.clear();
      var box =await Hive.openBox(HiveFieldConstants.userContactListBox);
      box.values.where((element) =>
      element.name.contains(searchKey)
      ).forEach((element) {
        contactList.add(element);
      });
      await box.close();
     }
      
}
     

