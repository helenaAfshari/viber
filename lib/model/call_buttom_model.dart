

import 'package:hive/hive.dart';
part 'call_buttom_model.g.dart';

 @HiveType(typeId:2)
class CallButtomModel extends HiveObject{

   @HiveField(0)
   String name;
   
   @HiveField(1)
   String phone;

   @HiveField(2)
   String imageProfile;

   CallButtomModel({
     required this.name,
     required this.phone,
     required this.imageProfile,
   }
   
   );
}