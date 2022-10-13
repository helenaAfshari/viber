

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







// List<CameraDescription>? cameras;
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras = await availableCameras();
//   final firstCamera = cameras.first
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   CameraController? controller;
//   String imagePath = "";
//   @override
//   void initState() {
//     super.initState();
//     controller = CameraController(cameras![1], ResolutionPreset.max);
//     controller?.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     if (!controller!.value.isInitialized) {
//       return Container();
//     }
//     var file = File;
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                 width: 200,
//                 height: 200,
//                 child: AspectRatio(
//                   aspectRatio: controller!.value.aspectRatio,
//                   child: CameraPreview(controller!),
//                 ),
//               ),
//               TextButton(
//                   onPressed: () async {
//                     try {
//                       final image = await controller!.takePicture();
//                       setState(() {
//                         imagePath = image.path;
//                       });
//                     } catch (e) {
//                       print(e);
//                     }
//                   },
//                   child: Text("Take Photo")),
//               if (imagePath != "")
//                 Container(
//                     width: 300,
//                     height: 300,
//                     child: Image.file(
//                     File()
//                     ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }










// Future<void> main() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: TakePictureScreen(
//         // Pass the appropriate camera to the TakePictureScreen widget.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }

// // A screen that allows users to take a picture using a given camera.
// class TakePictureScreen extends StatefulWidget {
//   const TakePictureScreen({
//     super.key,
//     required this.camera,
//   });

//   final CameraDescription camera;

//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }

// class TakePictureScreenState extends State<TakePictureScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     // To display the current output from the Camera,
//     // create a CameraController.
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.camera,
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );

//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Take a picture')),
//       // You must wait until the controller is initialized before displaying the
//       // camera preview. Use a FutureBuilder to display a loading spinner until the
//       // controller has finished initializing.
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the preview.
//             return CameraPreview(_controller);
//           } else {
//             // Otherwise, display a loading indicator.
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         // Provide an onPressed callback.
//         onPressed: () async {
//           // Take the Picture in a try / catch block. If anything goes wrong,
//           // catch the error.
//           try {
//             // Ensure that the camera is initialized.
//             await _initializeControllerFuture;

//             // Attempt to take a picture and get the file `image`
//             // where it was saved.
//             final image = await _controller.takePicture();

//             if (!mounted) return;

//             // If the picture was taken, display it on a new screen.
//             await Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(
//                   // Pass the automatically generated path to
//                   // the DisplayPictureScreen widget.
//                   imagePath: image.path,
//                 ),
//               ),
//             );
//           } catch (e) {
//             // If an error occurs, log the error to the console.
//             print(e);
//           }
//         },
//         child: const Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }

// // A widget that displays the picture taken by the user.
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({super.key, required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Image.file(File(imagePath)),
//     );
//   }
// }













