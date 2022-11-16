

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:hive/hive.dart';
part 'music_model.g.dart';

 @HiveType(typeId: 3)
class MusicModel extends HiveObject{

 
 @HiveField(0)
 AssetsAudioPlayer linkMusic;


 MusicModel({

  required this.linkMusic,

 });

}