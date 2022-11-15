

import 'package:hive/hive.dart';
part 'music_model.g.dart';

 @HiveType(typeId: 0)
class MusicModel extends HiveObject{

 @HiveField(0)
 String singerName;

 MusicModel({

  required this.singerName,

 });

}