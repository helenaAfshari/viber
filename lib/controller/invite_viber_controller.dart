


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:viber_getx/constants/hive_keys.dart';
import 'package:viber_getx/model/user_contact_list_model.dart';

class InviteViberController extends GetxController{


     TextEditingController userTextEditingController = TextEditingController();
     //if save contact number not show in list but there was no save number contact show in list InviteViber
     TextEditingController phoneTextEditingController = TextEditingController();
      RxList<UserContactListModel>contactList =RxList();
           
          @override
           void onInit()async{
            super.onInit();
           await readContact();
           }
       
       readContact()async{
          var box =await Hive.openBox(HiveFieldConstants.userContactListBox);
          box.values.forEach((element) {
          UserContactListModel userContactListModel = element;
            contactList.add(userContactListModel);  
            print(userContactListModel) ;
         
          });

       }
    

}