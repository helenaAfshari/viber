
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:viber_getx/binding.dart';
import 'package:viber_getx/model/calls_bottom_model/recents_calls_model.dart';
import 'package:viber_getx/component/theme_viber.dart';
import 'package:viber_getx/model/message_model.dart';
import 'package:viber_getx/model/user_inbox_list_model.dart';
import 'package:viber_getx/view/contact_list_screen.dart';
import 'package:viber_getx/view/main_screen.dart';
import 'model/user_contact_list_model.dart';
import 'view/calls_buttom_view/calls_in_viewall_screen.dart';


void main() async{
  await Hive.initFlutter();
  Hive
  ..registerAdapter(UserContactListModelAdapter())
  ..registerAdapter(UserInboxListModelAdapter())
  ..registerAdapter(MessageModelAdapter());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   
        var isdark = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      // getPages: [
      //   GetPage(name:routeMainScreen , page: () => MainScreen(),),
      // ],
      theme: isdark?darkMode():lightMode(),
     
       getPages: [
        GetPage(name: RouteMainScreen, page: (() => MainScreen())),
         GetPage(name: RouteCallsInViewAllRecentCalls, page: () => CallsInViewAllRecentCalls(),),
        GetPage(name: RouteContactListScreen, page: () => ContactListScreen(),binding: BindingContactController()),
       ],      
      home:MainScreen()
         
      
    );
  }
}
String RouteMainScreen = '/MainScreen';
String RouteCallsInViewAllRecentCalls = '/CallsInViewAllRecentCalls';
String RouteContactListScreen = '/ContactListScreen';


// main.dart


// main.dart
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         // Remove the debug banner
//         debugShowCheckedModeBanner: false,
//         title: 'Kindacode.com',
//         theme: ThemeData(
//           primarySwatch: Colors.indigo,
//         ),
//         home: const HomePage());
//   }
// }

// // Home Page
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kindacode.com'),
//         actions: [
//           // Navigate to the Search Screen
//           IconButton(
//               onPressed: () => Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (_) => const SearchPage())),
//               icon: const Icon(Icons.search))
//         ],
//       ),
//     );
//   }
// }

// // Search Page
// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           // The search area here
//           title: Container(
//         width: double.infinity,
//         height: 40,
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(5)),
//         child: Center(
//           child: TextField(
//             decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     /* Clear the search field */
//                   },
//                 ),
//                 hintText: 'Search...',
//                 border: InputBorder.none),
//           ),
//         ),
//       )),
//     );
//   }
// }















