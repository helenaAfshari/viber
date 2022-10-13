


import 'package:get/get.dart';

class BottomBarController extends GetxController{
     

   var tabIndex = 0.obs;
   void onTapTaped(int index){
      tabIndex.value = index;
   }

}