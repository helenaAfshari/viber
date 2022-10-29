
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:viber_getx/view/camera.dart';
import 'package:viber_getx/view/chat_screen.dart';

import '../controller/BottomBar_controller.dart';



class BottomBarChatScreen extends StatelessWidget {
  BottomNavController bottomNavController=Get.put(BottomNavController());
   BottomBarChatScreen({super.key});
      final screen=[
      Camera(),
      ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        (() => IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: screen,
        )
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.blue,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (value) {
          bottomNavController.changeIndex(value);
        },
        currentIndex: bottomNavController.selectedIndex.value,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "search",
            backgroundColor: Colors.purple,
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "search",
            backgroundColor: Colors.purple,
            ),
        ],
     ),
    );
  }
}


