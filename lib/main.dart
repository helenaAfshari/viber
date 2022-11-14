
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:viber_getx/binding.dart';
import 'package:viber_getx/component/theme_viber.dart';
import 'package:viber_getx/model/message_model.dart';
import 'package:viber_getx/model/user_inbox_list_model.dart';
import 'package:viber_getx/view/chat_screen.dart';
import 'package:viber_getx/view/contact_list_screen.dart';
import 'package:viber_getx/view/list_grid.dart';
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
      home:ChatScreen(),
      
      
    );
  }
}
String RouteMainScreen = '/MainScreen';
String RouteCallsInViewAllRecentCalls = '/CallsInViewAllRecentCalls';
String RouteContactListScreen = '/ContactListScreen';





// import 'package:flutter/material.dart';
// import 'package:viber_getx/gen/assets.gen.dart';
// void main(){
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<String> _listItem = [
//     // 'assets/images/img1.jpg',
//     // 'assets/images/img2.jpg',
//     // 'assets/images/img3.jpg',
//     // 'assets/images/img4.jpg',
//     // 'assets/images/img5.jpg',
//     // 'assets/images/img6.jpg',
//     Assets.images.avatar.path,
//     Assets.images.avatar.path,
//     Assets.images.avatar.path,

//   ];
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
// //                Navigator.pop(context);
//           },
//           child: Icon(Icons.close),
//         ),
//         backgroundColor: Colors.red[800],
//         title: Text('Dynamic Gridview Images'),
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               _related_image(),
//               SizedBox(height: 20,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _related_image(){
//     return Expanded(
//         child: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           children: _listItem.map((item) => Card(
//             color: Colors.transparent,
//             elevation: 0,
//             child: InkWell(
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                         image: AssetImage(item),
//                         fit: BoxFit.fill
//                     )
//                 ),
//               ),
//               onTap:  () {},
//             ),
//           )).toList(),
//         )
//     );
//   }
// }










