
import 'package:flutter/material.dart';
import 'package:viber_getx/constants/color_viber.dart';

class haInputDecoration{
 
   String? hintText;
   haInputDecoration({
    required this.hintText,
   });
   

   InputDecoration normalForms (){
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
        filled: true,
        fillColor: haSolidColors.lightScafoldBackgroundColor,
    );

}
}