// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class BottomNavigation extends StatelessWidget {
//    BottomNavigation({
//     //داخل کانستراکتور تعریف کردیم که بتوانیم از بیرون پاس بدهیم بهش
//     Key? key,
//     required this.size,
//     required this.bodyMargin,
//     required this.changeScreen,
//   }) : super(key: key);

//   final Size size;
//   final double bodyMargin;

//   //نوعی متد تعریف کردن است
//   final Function(int) changeScreen;
 

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       bottom: 10,
//       right: 0,
//       left: 0,
//       child: Container(
//         height: size.height / 10,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           colors: GradientColors.bottomNavBackground,
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         )),
//         child: Padding(
//           padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
//           child: Container(
//             height: size.height / 8,
//             decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(18)),
//                 gradient: LinearGradient(colors: GradientColors.bottomNave)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(
//                   onPressed: () => changeScreen(0),
//                   icon: ImageIcon(
//                     AssetImage(Assets.icons.home.path),
//                     color: Colors.white,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     //TODO check Login sTatus
//                      Get.find<RegisterController>().routTowriteBottomSheet();
                     
//                   },
//                   icon: ImageIcon(
//                     AssetImage(Assets.icons.writer.path),
//                     color: Colors.white,
                    
//                   ),
//                 ),
//                 IconButton(
//                     onPressed: () => changeScreen(1),
//                     icon: ImageIcon(
//                       AssetImage(Assets.icons.user.path),
//                       color: Colors.white,
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
