
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viber_getx/controller/chat_box_controller/picker_file_controller.dart';


class GridList extends StatelessWidget{
   FilePickerController filePickerController = Get.put(FilePickerController());
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        body:
          SizedBox(
            width: Get.width,
            height: double.infinity,
            child: Obx(
              () =>  GridView.builder(
                itemCount:20, 
                shrinkWrap: true,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  childAspectRatio: 1
                ) , 
                itemBuilder:(context, index) {
                  return Container(
                    color: Colors.blue,
                    width: 50,
                    height: 100,
                    child:  
                   Image.file(File(
                    filePickerController.file.value.path!)),
                   );
                }),
            )))
                );
  
          
              
          
        
  }


}

  // Obx(
  //               (() => Image.file(File(
  //                 filePickerController.file.value.path!))
  //               ),
  //             ),