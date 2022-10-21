
import 'package:flutter/material.dart';
import 'package:viber_getx/constants/color_viber.dart';

ThemeData lightMode(){

  return ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: backgroundColorLightModeTheme),
    scaffoldBackgroundColor: lightScafoldBackgroundColor,
  );
}

ThemeData darkMode(){
  return ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: backgroundColorDarkModeTheme),
    scaffoldBackgroundColor: darkScafoldBackgroundColor,
  );
}
   
