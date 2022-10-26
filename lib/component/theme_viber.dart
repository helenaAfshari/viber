
import 'package:flutter/material.dart';
import 'package:viber_getx/constants/color_viber.dart';

ThemeData lightMode(){

  return ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: haSolidColors.backgroundColorLightModeTheme),
    scaffoldBackgroundColor: haSolidColors.lightScafoldBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: haSolidColors.colorIconBack),
       ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: haSolidColors.backgroundBottomContact),
       ),
        filled: true,
        fillColor: haSolidColors.lightScafoldBackgroundColor,
    )
  );
}

ThemeData darkMode(){
  return ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: haSolidColors.backgroundColorDarkModeTheme),
    scaffoldBackgroundColor: haSolidColors.darkScafoldBackgroundColor,
  );
}
   
