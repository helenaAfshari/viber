
import 'package:hive/hive.dart';

part 'user_contact_list_model.g.dart';

@HiveType(typeId: 0)
class UserContactListModel extends HiveObject{

  @HiveField(0)
  String name;
  @HiveField(1)
  String phone;
  @HiveField(2)
  String profileUser;

  UserContactListModel({
    required this.name,
    required this.phone,
    required this.profileUser,
  });
  
}



