
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/controller/bottom_bar_controller.dart';
import 'package:viber_getx/view/calls_buttom_view/call_bottom_screen.dart';
import 'package:viber_getx/view/chat_button_screen.dart';
import 'package:viber_getx/view/main_screen.dart';



  BottomBarController bottomBarController = Get.put(BottomBarController());

      TextStyle unselectedLabelStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10);

  final TextStyle selectedLabelStyle =
      TextStyle( fontWeight: FontWeight.w500, fontSize: 10);

   buildBottomNavigationBar(context, bottomBarController){
    return Obx(() => 
         SizedBox(
          height: 50,
          child: BottomNavigationBar(
            
            showUnselectedLabels: true,    
            onTap: bottomBarController.onTapTaped,     
            currentIndex: bottomBarController.tabIndex.value,   
            backgroundColor:haSolidColors. colorBackgroundBottomBar,
            unselectedItemColor: haSolidColors.unselectedBottomBar,
            selectedItemColor: haSolidColors.backgroundColorFloatingAction,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: const[
            
              BottomNavigationBarItem(
                icon: 
                  
                    Icon(
                    Icons.chat,
                    size: 20.0,
                  ),
                
                label: 'All',
               
              ),
              BottomNavigationBarItem(
                icon: 
                  
                   Icon(
                    Icons.call,
                    size: 20.0,
                  ),
                
                label: 'Viber',
              
              ),
           
              
            ],
          ),
        ));
   }

     


          




   