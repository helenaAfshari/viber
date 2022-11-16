
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:viber_getx/binding.dart';
import 'package:viber_getx/component/theme_viber.dart';
import 'package:viber_getx/model/message_model.dart';
import 'package:viber_getx/model/user_inbox_list_model.dart';
import 'package:viber_getx/view/contact_list_screen.dart';
import 'package:viber_getx/view/main_screen.dart';
import 'package:viber_getx/view/music_screen.dart';
import 'model/musicModel/music_model.dart';
import 'model/user_contact_list_model.dart';
import 'view/calls_buttom_view/calls_in_viewall_screen.dart';



void main() async{
  await Hive.initFlutter();
  Hive
  ..registerAdapter(UserContactListModelAdapter())
  ..registerAdapter(UserInboxListModelAdapter())
  ..registerAdapter(MusicModelAdapter())
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
      theme: isdark?darkMode():lightMode(),
     
       getPages: [
        GetPage(name: RouteMainScreen, page: (() => MainScreen())),
         GetPage(name: RouteCallsInViewAllRecentCalls, page: () => CallsInViewAllRecentCalls(),),
        GetPage(name: RouteContactListScreen, page: () => ContactListScreen(),binding: BindingContactController()),
       ],      
      home:MusicScreen(),
      
      
    );
  }
}
String RouteMainScreen = '/MainScreen';
String RouteCallsInViewAllRecentCalls = '/CallsInViewAllRecentCalls';
String RouteContactListScreen = '/ContactListScreen';















































// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
 
// void main() {
//   runApp(const MyApp());
// }
 
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
 
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // on below line we are specifying title of our app
//       title: 'GFG',
//       // on below line we are hiding debug banner
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // on below line we are specifying theme
//         primarySwatch: Colors.green,
//       ),
//       // First screen of our app
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
 
//   @override
//   _HomePageState createState() => _HomePageState();
// }
 
// class _HomePageState extends State<HomePage> {
//   Completer<GoogleMapController> _controller = Completer();
//   // on below line we have specified camera position
//   static final CameraPosition _kGoogle = const CameraPosition(
//       target: LatLng(20.42796133580664, 80.885749655962),
//     zoom: 14.4746,
//   );
 
//   // on below line we have created the list of markers
//   final List<Marker> _markers = <Marker>[
//     Marker(
//         markerId: MarkerId('1'),
//       position: LatLng(20.42796133580664, 75.885749655962),
//       infoWindow: InfoWindow(
//         title: 'My Position',
//       )
//   ),
//   ];
 
//   // created method for getting user current location
//   Future<Position> getUserCurrentLocation() async {
//     await Geolocator.requestPermission().then((value){
//     }).onError((error, stackTrace) async {
//       await Geolocator.requestPermission();
//       print("ERROR"+error.toString());
//     });
//     return await Geolocator.getCurrentPosition();
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF0F9D58),
//         // on below line we have given title of app
//         title: Text("GFG"),
//       ),
//        body: Container(
//         child: SafeArea(
//           // on below line creating google maps
//           child: GoogleMap(
//           // on below line setting camera position
//           initialCameraPosition: _kGoogle,
//           // on below line we are setting markers on the map
//           markers: Set<Marker>.of(_markers),
//           // on below line specifying map type.
//           mapType: MapType.normal,
//           // on below line setting user location enabled.
//           myLocationEnabled: true,
//           // on below line setting compass enabled.
//           compassEnabled: true,
//           // on below line specifying controller on map complete.
//           onMapCreated: (GoogleMapController controller){
//                 _controller.complete(controller);
//             },
//           ),
//         ),
//       ),
//       // on pressing floating action button the camera will take to user current location
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async{
//           getUserCurrentLocation().then((value) async {
//             print(value.latitude.toString() +" "+value.longitude.toString());
 
//             // marker added for current users location
//             _markers.add(
//                 Marker(
//                   markerId: MarkerId("2"),
//                   position: LatLng(value.latitude, value.longitude),
//                   infoWindow: InfoWindow(
//                     title: 'My Current Location',
//                   ),
//                 )
//             );
 
//             // specified current users location
//             CameraPosition cameraPosition = new CameraPosition(
//               target: LatLng(value.latitude, value.longitude),
//               zoom: 14,
//             );
 
//             final GoogleMapController controller = await _controller.future;
//             controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//             setState(() {
//             });
//           });
//         },
//         child: Icon(Icons.local_activity),
//       ),
//     );
//   }
// }


















// import 'package:flutter/material.dart';
// import 'package:viber_getx/gen/assets.gen.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       title: 'Flutter Demo',
//       theme:  ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home:  MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
 


//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Center(
//         child: ListView(
//           children: [
//             Image.asset(Assets.images.avatar.path,  
//               width: 600.0,
//               height: 240.0,
//               fit: BoxFit.cover,),
//             Image.asset(Assets.images.avatar.path,  
//               width: 600.0,
//               height: 240.0,
//               fit: BoxFit.cover,),
//             Image.asset(Assets.images.avatar.path,  
//               width: 600.0,
//               height: 240.0,
//               fit: BoxFit.cover,),
//             Image.asset(Assets.images.avatar.path,  
//               width: 600.0,
//               height: 240.0,
//               fit: BoxFit.cover,),
//           ],
          
//         ),
//       ),
//     );
//   }
// }






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










