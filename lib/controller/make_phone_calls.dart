
import 'package:url_launcher/url_launcher.dart';

makingPhoneCalls()async{
      var url = Uri.parse("tel:");
      if(await canLaunchUrl(url)){
        launchUrl(url);
      }else
      {
        throw 'not url $url';
      }
}