

import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:viber_getx/constants/hive_keys.dart';
import 'package:viber_getx/model/user_inbox_list_model.dart';


//این برای اون صفحه که ببینیم پیام اومده یا نه
class UserInboxListController extends GetxController{

     RxList<UserInboxListModel>inboxList = RxList();
       var index = 0;
      @override
       void onInit()async{
        super.onInit();
       await readInbox();
       }
       
     addToInbox({required String name,required String phone})async{
                 
          var box = await Hive.openBox(HiveFieldConstants.userInboxListBox);
          var user =  UserInboxListModel(
           name: name,
           phone: phone,
            profileUser: "user profile",
         
            );
 
             //is was not possible to add two identical phone numbers
            //  if(!box.values.contains(user)){   
                    // box.add(user);              
            //       }


            

                  //not same add phone number 
                  bool exists = false;
            for (var element in box.values) {
               if(element.phone == phone ){
                  log("phone: $phone exists. please select another user");
                  exists =true;
                  break;
               }
            }
            //add user
            if(!exists){
             log("phone: $phone Not exists. user aded...");
              box.add(user);
            }
        
            inboxList.clear();
            await readInbox();
 

     }


     readInbox()async{
          var box =await Hive.openBox(HiveFieldConstants.userInboxListBox);
         box.values.forEach((element) {
              UserInboxListModel user = element;
              inboxList.add(user);
              print(user.name);
              
          }
         
         );
     }
}
     

