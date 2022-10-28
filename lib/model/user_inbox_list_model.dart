
import 'package:hive/hive.dart';
import 'package:viber_getx/model/message_model.dart';
part 'user_inbox_list_model.g.dart';

@HiveType(typeId: 1)
class UserInboxListModel extends HiveObject{

  @HiveField(0)
  String name;
  @HiveField(1)
  String phone; //peerId
  @HiveField(2)
  String profileUser;
  //when new message in save list messages

  UserInboxListModel({
    required this.name,
    required this.phone,
    required this.profileUser,


  });
  
}