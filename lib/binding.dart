
import 'package:get/get.dart';

import 'package:viber_getx/controller/bottom_bar_controller.dart';
import 'package:viber_getx/controller/url_in_project.dart';
import 'package:viber_getx/controller/user_contact_controller.dart';
import 'package:viber_getx/controller/user_inbox_list_controller%20.dart';

class BindingContactController implements Bindings{
  @override
  void dependencies() {
    
    Get.lazyPut(() => UserContactController());
  }

}

class BindingInboxController implements Bindings{
  @override
  void dependencies() {
      Get.lazyPut(() => UserInboxListController());
  }
    
}

 class BindingUrlController implements Bindings{
  @override
  void dependencies() {
      Get.lazyPut(() => UrlProject());
  }
   
 }


