
import 'package:hive/hive.dart';

part 'user_inbox_list_model.g.dart';

@HiveType(typeId: 1)
class UserInboxListModel extends HiveObject{

  @HiveField(0)
  String name;
  @HiveField(1)
  String phone;
  @HiveField(2)
  String profileUser;

  UserInboxListModel({
    required this.name,
    required this.phone,
    required this.profileUser,
  });
  
}