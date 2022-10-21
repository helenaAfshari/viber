

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';


class UrlProject extends GetxController{
  
makingSendSms()async{

  var url = Uri.parse('sms: 09123035815?body:invite');
  if(await canLaunchUrl(url)){
    await launchUrl(url);
  }else{
    throw 'not lounch Url $url';
  }
}
  makingPhoneCalls()async{
      var url = Uri.parse("tel:");
      if(await canLaunchUrl(url)){
        launchUrl(url);
      }else
      {
        throw 'not url $url';
      }
}
}
