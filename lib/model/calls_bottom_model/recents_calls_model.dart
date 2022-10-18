

import 'package:hive/hive.dart';
part 'recents_calls_model.g.dart';

 @HiveType(typeId:2)
class RecentsCallsModel extends HiveObject{

   @HiveField(0)
   String name;
   
   @HiveField(1)
   String phone;

   @HiveField(2)
   String imageProfile;

   @HiveField(3)
    String call;

   RecentsCallsModel({
     required this.name,
     required this.phone,
     required this.imageProfile,
     required this.call
   }
   
   );
}