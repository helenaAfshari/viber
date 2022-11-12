


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/controller/picker_file_controller.dart';


class GridList extends StatelessWidget{
   FilePickerController filePickerController = Get.put(FilePickerController());
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        body:
          GridView.builder(
            itemCount: 21, 
            shrinkWrap: true,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
              crossAxisCount: 3,
            ) , 
            itemBuilder:(context, index) {
              return Container(
                color: Colors.blue,
                width: 50,
                height: 100,
                child: Text("gg"),
              );
            },),
           ),
        );
  }


}

  // Obx(
  //               (() => Image.file(File(
  //                 filePickerController.file.value.path!))
  //               ),
  //             ),