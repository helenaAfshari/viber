
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/controller/bottom_bar_controller.dart';
import 'package:viber_getx/view/calls_buttom_view/call_bottom_screen.dart';
import 'package:viber_getx/view/chat_button_screen.dart';
import 'package:viber_getx/view/main_screen.dart';


  class BottomBar extends StatefulWidget {
   BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
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
            backgroundColor: colorBackgroundBottomBar,
            unselectedItemColor: unselectedBottomBar,
            selectedItemColor: backgroundColorFloatingAction,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: const[
            
              BottomNavigationBarItem(
                icon: 
                  
                    Icon(
                    Icons.chat,
                    size: 20.0,
                  ),
                
                label: 'Chat',
               
              ),
              BottomNavigationBarItem(
                icon: 
                  
                   Icon(
                    Icons.call,
                    size: 20.0,
                  ),
                
                label: 'Calls',
              
              ),
              BottomNavigationBarItem(
                icon: 
                 
                   Icon(
                    Icons.more,
                    size: 20.0,
                  ),
                
                label: 'More',
                backgroundColor: Color.fromARGB(255, 110, 121, 146),
              ),
              
            ],
          ),
        ));
   }

     @override
     Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationBar(context, bottomBarController),
      body: Obx(() => IndexedStack(
            index: bottomBarController.tabIndex.value,
              children: [
                   ChatBottomScreen(),
                   CalsBottomScreen(),
                          
              ],
          ),
          
          ),
    ));
     }
}

          




   