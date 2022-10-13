// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_contact_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserContactListModelAdapter extends TypeAdapter<UserContactListModel> {
  @override
  final int typeId = 0;

  @override
  UserContactListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserContactListModel(
      name: fields[0] as String,
      phone: fields[1] as String,
      profileUser: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserContactListModel obj) {
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
      other is UserContactListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
