


import 'package:hive/hive.dart';
part 'message_model.g.dart';

@HiveType(typeId: 2)
class MessageModel extends HiveObject{

@HiveField(0)
  String?name;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  String? profileUser;
  @HiveField(3)
  String? peerId;
  @HiveField(4)
  String? time;
  @HiveField(5)
  String? content;
  @HiveField(6)
  String? type;  //Text//Voice//Video//Image//Document

  
  MessageModel({
    required this.name,
    required this.phone,
    required this.profileUser,
    required this.peerId,
    required this.time,
    required this.content,
    required this.type,

  });


}