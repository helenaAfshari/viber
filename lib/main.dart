

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:viber_getx/binding.dart';
import 'package:viber_getx/view/call_bottom_screen.dart';
import 'package:viber_getx/component/theme_viber.dart';
import 'package:viber_getx/model/user_inbox_list_model.dart';
import 'package:viber_getx/view/chat_button_screen.dart';
import 'package:viber_getx/view/contact_list_screen.dart';
import 'package:viber_getx/view/main_screen.dart';

import 'model/user_contact_list_model.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserContactListModelAdapter());
  Hive.registerAdapter(UserInboxListModelAdapter());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   
        var isdark = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      // getPages: [
      //   GetPage(name:routeMainScreen , page: () => MainScreen(),),
      // ],
      theme: isdark?darkMode():lightMode(),
       getPages: [
        GetPage(name: '/MainScreen', page: (() => MainScreen())),
        GetPage(name: '/ContactListScreen', page: () => ContactListScreen(),binding: BindingContactController()),
       ],      
      home:MainScreen()
         
      
    );
  }
}
String routeMainScreen = '/MainScreen';

























// importing dependencies
// import 'package:flutter/material.dart';
// // cupertino package was unuses
// import 'package:url_launcher/url_launcher.dart';
 
 
// function to trigger the app build
// void main() => runApp(const MyApp());
 
// _makingPhoneCall() async {
//   var url = Uri.parse("tel:9776765434");
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
 
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
      
//         body: SafeArea(
//           child: Center(
//             child: Column(
//               children: [
//             //Text
             
//                 Container(
//                   height: 20.0,
//                 ),
//                ElevatedButton(
//                   onPressed: _makingPhoneCall,
                  
//                   child: const Text('Here'),
//                 ), // ElevatedButton
 
 
//             // DEPRECATED
//                 // RaisedButton(
//                 //   onPressed: _makingPhoneCall,
//                 //   child: Text('Call'),
//                 //   textColor: Colors.black,
//                 //   padding: const EdgeInsets.all(5.0),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






