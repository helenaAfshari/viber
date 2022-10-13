
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/view/call_bottom_screen.dart';
import 'package:viber_getx/constants/color_viber.dart';
import 'package:viber_getx/controller/bottom_bar_controller.dart';
import 'package:viber_getx/controller/user_inbox_list_controller%20.dart';
import 'package:viber_getx/component/bottom_bar.dart';
import 'package:viber_getx/view/chat_button_screen.dart';


class MainScreen extends StatefulWidget {
   MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
   RxBool selectedBottomIndex = false.obs;
   UserInboxListController userInboxListController = Get.put(UserInboxListController());

 BottomBarController bottomBarController = Get.put(BottomBarController());
      TextStyle unselectedLabelStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10);

  final TextStyle selectedLabelStyle =
      TextStyle( fontWeight: FontWeight.w500, fontSize: 10);

     @override
     void initState(){
      super.initState();
      WidgetsBinding.instance.addObserver(this);

     }
     @override
     void dispose() {
         
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);

  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed){
      userInboxListController.readInbox();
    }
  }
  
     
  @override
  Widget build(BuildContext context) {

        return  SafeArea(
         
            child: Scaffold(
               
                 
              bottomNavigationBar: BottomBar(),
                 
            
           ));
         
          
      
          
        
         
            
        
        
        
       
         
        
       
       
       
      
         
        


          
  }
}



  // buildBottomNavigationBar(context, bottomBarController){
      
  // BottomBarController bottomBarController = Get.put(BottomBarController());

  //       TextStyle unselectedLabelStyle = TextStyle(
  //     fontWeight: FontWeight.w500,
  //     fontSize: 10);

  // final TextStyle selectedLabelStyle =
  //     TextStyle( fontWeight: FontWeight.w500, fontSize: 10);
  //   return Obx(() => 
  //        SizedBox(
  //         height: 50,
  //         child: BottomNavigationBar(
            
  //           showUnselectedLabels: true,    
  //           onTap: bottomBarController.onTapTaped,     
  //           currentIndex: bottomBarController.tabIndex.value,   
  //           backgroundColor: colorBackgroundBottomBar,
  //           unselectedItemColor: unselectedBottomBar,
  //           selectedItemColor: colorFloatingAction,
  //           unselectedLabelStyle: unselectedLabelStyle,
  //           selectedLabelStyle: selectedLabelStyle,
  //           items: const[
            
  //             BottomNavigationBarItem(
  //               icon: 
                  
  //                   Icon(
  //                   Icons.chat,
  //                   size: 20.0,
  //                 ),
                
  //               label: 'Chat',
  //               backgroundColor: Color.fromARGB(255, 162, 181, 229),
  //             ),
  //             BottomNavigationBarItem(
  //               icon: 
                  
  //                  Icon(
  //                   Icons.call,
  //                   size: 20.0,
  //                 ),
                
  //               label: 'Calls',
  //               backgroundColor: Color.fromARGB(255, 175, 177, 180),
  //             ),
  //             BottomNavigationBarItem(
  //               icon: 
                 
  //                  Icon(
  //                   Icons.more,
  //                   size: 20.0,
  //                 ),
                
  //               label: 'More',
  //               backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
  //             ),
              
  //           ],
            
  //         ),
  //       ),
  //       );
  //   }

  // @override
  // Widget build(BuildContext context) {
  //    BottomBarController bottomBarController = Get.put(BottomBarController());
  //   return SafeArea(
  //       child: Scaffold(
  //     bottomNavigationBar:
  //         buildBottomNavigationBar(context, bottomBarController),
  //     body: Obx(() => IndexedStack(
  //           index: bottomBarController.tabIndex.value,
  //             children: [
  //                   MainScreen(),
  //                   ChatScreen(),
  //                   ChatScreen(),       
  //             ],
  //         ),
          
  //         ),
  //   ));
  // }




























// class BottomBar extends StatefulWidget {
 

//   @override
//   _BottomBarState createState() => _BottomBarState();

//    late final Function(int) changeScreen;
// }

// class _BottomBarState extends State<BottomBar> {
//   int clickIcons = 0;

 

//   void onTabTapped(int index) {
//     setState(() {
//       clickIcons = index;
//     }
//     );

//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 0,
//         backgroundColor: colorBackgroundBottomBar,
//         unselectedItemColor: unselectedBottomBar,
//         fixedColor: colorFloatingAction,
//          items: [
          
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat_sharp),
//             label: 'Chats',
//             activeIcon: Container(
//                   height: 50,
//                   width: 50,
//                   color: Colors.red,
//             ),
              
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.call),
            
//             label: 'Calls',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu_sharp),
//             label: 'More')
//         ],
//         currentIndex: clickIcons,
//         onTap: onTabTapped,
        
//       ),
        

//         //  Divider(endIndent: 1,color: unselectedBottomBar,indent: 1,thickness: 0.5),
    
        
      

//     );
//   }
// }
