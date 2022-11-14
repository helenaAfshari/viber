

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MenuControllerr  extends GetxController{
  var isMenu = false.obs;
   TextEditingController textEditingController = TextEditingController();
   FocusNode focusNode = FocusNode();
  

   @override
   void onInit(){
    super.onInit();
    focusNode.addListener(() {
       isMenu.value = false;
    });
    
   }
     @override
   void onClose(){
    super.onClose();
    textEditingController.dispose();
   }

}