
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:viber_getx/binding.dart';
import 'package:viber_getx/model/calls_bottom_model/recents_calls_model.dart';
import 'package:viber_getx/component/theme_viber.dart';
import 'package:viber_getx/model/user_inbox_list_model.dart';
import 'package:viber_getx/view/contact_list_screen.dart';
import 'package:viber_getx/view/main_screen.dart';
import 'model/user_contact_list_model.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserContactListModelAdapter());
  Hive.registerAdapter(UserInboxListModelAdapter());
  Hive.registerAdapter(RecentsCallsModelAdapter());
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
        // GetPage(name: '/CallsInViewAllRecentCalls', page: () => CallsInViewAllRecentCalls(),),
        GetPage(name: '/ContactListScreen', page: () => ContactListScreen(),binding: BindingContactController()),
       ],      
      home:MainScreen()
         
      
    );
  }
}
String routeMainScreen = '/MainScreen';








































// // import 'package:flutter/cupertino.dart'; Unused Dependency
// import 'package:url_launcher/url_launcher.dart';
 
// // app build process is triggered here
// void main() => runApp(const MyApp());
 
 
// _sendingSMS() async {
//   var url = Uri.parse('sms:09123035815?body=invite');
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
//         appBar: AppBar(
//           title: const Text('Geeks for Geeks'),
//           backgroundColor: Colors.green,
//         ),
//         body: SafeArea(
//           child: Center(
//             child: Column(
//               children: [
//                 Container(
//                   height: 200.0,
//                 ),
//                 const Text(
//                   'Welcome to GFG!',
//                   style: TextStyle(
//                     fontSize: 35.0,
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Container(
//                   height: 20.0,
//                 ),
//                 const Text(
//                   'For any Queries, Mail us',
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     color: Colors.green,
//                     //fontWeight: FontWeight.bold,
//                   ),
//                 ),
               
//               // ElevatedButton
 
//                 Container(
//                   height: 20.0,
//                 ),
//                 const Text(
//                   'Or Send SMS',
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     color: Colors.green,
//                     //fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Container(
//                   height: 50,
//                 ),
//                 ElevatedButton(
//                   onPressed: _sendingSMS,
                 
//                   child:  Text('Here'),
//                 ), // ElevatedButton
 
               
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





























