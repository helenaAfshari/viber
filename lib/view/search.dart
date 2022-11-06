

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:viber_getx/constants/color_viber.dart';
import '../controller/user_contact_controller.dart';

class MyWidget extends StatelessWidget {
     var userContactController = Get.find<UserContactController>();
   MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //     backgroundColor: haSolidColors.backgroundBottomContact,
      //     title: Container(
      //   width: double.infinity,
      //   height: 40,
      //   decoration: BoxDecoration(
        
      //       color: Colors.white, borderRadius: BorderRadius.circular(5)),
      //      child: TextFormField( onChanged: (value) => userContactController.searchContact(value),),
      // ),
         

        ),
    );
  }
}