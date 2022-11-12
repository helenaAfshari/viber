


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmojiPickerControllerr  extends GetxController{
  var isEmojiVisible = false.obs;
   TextEditingController textEditingController = TextEditingController();
   FocusNode focusNode = FocusNode();

   @override
   void onInit(){
    super.onInit();
    focusNode.addListener(() {
       isEmojiVisible.value = false;
    });
   }
     @override
   void onClose(){
    super.onClose();
    textEditingController.dispose();
   }

}