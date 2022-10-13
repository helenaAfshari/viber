

import 'package:flutter/cupertino.dart';
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
            profileUser: "user profile",);
              


             if(box.values.contains(user)){
                   
                    box.add(user);
                             
                  }
                  inboxList.clear();
                  await readInbox();
              
                
                  
                   
                  
                    
                
                 
                   
                   
            

               
                
    //  box.put('user',user);
    // return false;
    
                
                
         
              //  if(inboxList.contains(user)){
              //        inboxList.add(user);
              //        return false;
              //  }
              //  box.put('user', user);
              //  return true;

            
             
          
          //read user from box
          // box.values.forEach((element) {
          //     UserInboxListModel user = element;
          //     inboxList.add(user);
          //     print(user.name);
              
          // });

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
     

