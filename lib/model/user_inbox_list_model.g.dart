// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_inbox_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInboxListModelAdapter extends TypeAdapter<UserInboxListModel> {
  @override
  final int typeId = 1;

  @override
  UserInboxListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInboxListModel(
      name: fields[0] as String,
      phone: fields[1] as String,
      profileUser: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserInboxListModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.profileUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInboxListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
