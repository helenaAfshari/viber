
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
      home:GridList(),
      
      
    );
  }
}
String RouteMainScreen = '/MainScreen';
String RouteCallsInViewAllRecentCalls = '/CallsInViewAllRecentCalls';
String RouteContactListScreen = '/ContactListScreen';





















// import 'package:flutter/material.dart';


// class EmojiScreen extends StatefulWidget {
//   const EmojiScreen({Key? key}) : super(key: key);

//   @override
//   State<EmojiScreen> createState() => _EmojiScreenState();
// }

// class _EmojiScreenState extends State<EmojiScreen> {
//   FocusNode focusNode = FocusNode();
//   bool isEmojiVisible = false;
//   TextEditingController messagecontroller = TextEditingController();
//   final messages = <String>[];
//   final message = '';
//   @override
//   void initState() {
//     focusNode.addListener(() {
//       if (focusNode.hasFocus) {
//         setState(() {
//           isEmojiVisible = false;
//         });
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Emoji Picker'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               reverse: true,
//               physics: const BouncingScrollPhysics(),
//               children: messages
//                   .map((message) => MessageWidget(message: message))
//                   .toList(),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: messagecontroller,
//               minLines: 1,
//               focusNode: focusNode,
//               maxLines: 4,
//               decoration: InputDecoration(
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5),
//                   child: isEmojiVisible
//                       ? InkWell(
//                           onTap: focusNode.requestFocus,
//                           child: const Icon(
//                             Icons.keyboard_rounded,
//                             color: Colors.purple,
//                             size: 25,
//                           ))
//                       : InkWell(
//                           onTap: () {
//                             focusNode.unfocus();
//                             focusNode.canRequestFocus = false;
//                             setState(() {
//                               isEmojiVisible = !isEmojiVisible;
//                             });
//                           },
//                           child: const Icon(
//                             Icons.emoji_emotions_outlined,
//                             color: Colors.blue,
//                             size: 25,
//                           ),
//                         ),
//                 ),
//                 suffixIcon: InkWell(
//                   onTap: () {
//                     setState(() {
//                       messages.insert(0, messagecontroller.text);
//                     });

//                     messagecontroller.clear();
//                   },
//                   child: const Icon(
//                     Icons.send,
//                     color: Colors.blue,
//                     size: 25,
//                   ),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).padding.bottom + 10,
//           ),
//           isEmojiVisible
//               ? SizedBox(
//                   height: 265,
//                   child: Offstage(
//                     offstage: !isEmojiVisible,
//                     child: EmojiPicker(
//                       onEmojiSelected: (category, emoji) {
//                         setState(() {
//                           messagecontroller.text =
//                               messagecontroller.text + emoji.emoji;
//                         });
//                       },
//                     ),
//                   ),
//                 )
//               : const SizedBox(),
//         ],
//       ),
//     );
//   }
// }






























// import 'package:flutter/material.dart';


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         body: SingleChildScrollView(
//           child: MyLoginPage(),
//         ),
//       ),
//     );
//   }
// }

// class MyLoginPage extends StatefulWidget {
  



//   @override
//   _MyLoginPageState createState() => _MyLoginPageState();
// }

// class _MyLoginPageState extends State<MyLoginPage> {
 
//   TextStyle style = TextStyle(fontSize: 25.0);

//   @override
//   Widget build(BuildContext context) {
//     final emailField = Padding(
//       padding: const EdgeInsets.only(top: 310),
//       child: TextField(
        
      
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             prefixIcon: Icon(Icons.search),
//             hintText: "Email",
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red, width: 32.0),
//                 borderRadius: BorderRadius.circular(97.0))),
       
//       ),
//     );
//     final passwordField = TextField(
//       obscureText: true,
    
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           prefixIcon: Icon(Icons.key),
//           hintText: "Password",
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.red, width: 32.0),
//               borderRadius: BorderRadius.circular(25.0))),
      
//     );

//     return Center(
//       child: Column(
//         children: <Widget>[
//           Container(
//             color: Colors.yellow[300],
//             height: 300.0,
//           ),
//           emailField,
//           passwordField
//         ],
//       ),
//     );
//   }
// }











  

  



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter BottomSheet GetX'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               'Hello world',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           openBottomSheet();
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   void openBottomSheet() {
//     Get.bottomSheet(
//       Scaffold(
//           appBar: AppBar(title: Text("Sign In")),
//           body: Center(
//               child: Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 20),
//                       const TextField(
//                         keyboardType: TextInputType.name,
//                         decoration: InputDecoration(
//                                     labelText: 'User Name'),
//                       ),
//                       const TextField(
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                                     labelText: 'Password'),
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         children: [
//                           ElevatedButton(
//                               onPressed: () {}, 
//                               child: const Text('Submit')),
//                           const SizedBox(
//                             width: 15,
//                           ),
//                           OutlinedButton(
//                             onPressed: () {
//                               Get.back();
//                             },
//                             child: const Text('Close'),
//                           ),
//                         ],
//                       )
//                     ],
//                   )))),
   
//     );
//   }
// }



























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















