
import 'package:flutter/material.dart';
import 'package:viber_getx/constants/color_viber.dart';

class haInputDecoration{
 
   String? hintText;
   IconData icon;
   haInputDecoration({
    required this.hintText,
    required this.icon,
   });
   

   InputDecoration phoneInputeDecoration (){
    return InputDecoration(
    hintText:hintText ,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: haSolidColors.colorIconBack),
       ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color:haSolidColors.backgroundBottomContact),
       ),
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: haSolidColors.lightScafoldBackgroundColor,
    );

}

   InputDecoration searchForms (){
    return InputDecoration(
      
    hintText:hintText ,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: haSolidColors.colorIconBack),
       ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color:haSolidColors.backgroundBottomContact),
       ),
       prefixIcon: Icon(icon),
        filled: true,
        fillColor: haSolidColors.lightScafoldBackgroundColor,
    );

}

   InputDecoration userNameInputeDecoration (){
    return InputDecoration(
    hintText:hintText ,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: haSolidColors.colorIconBack),
       ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color:haSolidColors.backgroundBottomContact),
       ),
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: haSolidColors.lightScafoldBackgroundColor,
    );

}

  static InputDecoration typeMessageInChatScreen(String hintText){
  return InputDecoration(
      hintText: hintText,
       focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
       ),
        enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide:  BorderSide.none,
       ),
      

  );
}
}