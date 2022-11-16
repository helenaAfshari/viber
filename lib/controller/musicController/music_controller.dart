
import 'package:hive_flutter/hive_flutter.dart';
import 'package:viber_getx/constants/hive_keys.dart';
import 'package:viber_getx/model/musicModel/music_model.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class SaveMusic{

   
    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
     

     addToLinkMusic() async{

      var box = await Hive.openBox(HiveFieldConstants.musicInboxList);
      var music = MusicModel(
        linkMusic: audioPlayer);
        box.add(music);
     audioPlayer.open(Audio('assets/sound/talkhi.mp3'),
     autoStart: false,showNotification: true);
     
     }

  
}



