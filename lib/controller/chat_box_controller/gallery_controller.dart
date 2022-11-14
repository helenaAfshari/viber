

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GalleryController  extends GetxController{
  var isGalleryVisible = false.obs;
   TextEditingController textEditingController = TextEditingController();
   FocusNode focusNode = FocusNode();
  

   @override
   void onInit(){
    super.onInit();
    focusNode.addListener(() {
       isGalleryVisible.value = false;
    });
    
   }
  

}