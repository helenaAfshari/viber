// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recents_calls_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentsCallsModelAdapter extends TypeAdapter<RecentsCallsModel> {
  @override
  final int typeId = 2;

  @override
  RecentsCallsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentsCallsModel(
      name: fields[0] as String,
      phone: fields[1] as String,
      imageProfile: fields[2] as String,
      call: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecentsCallsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.imageProfile)
      ..writeByte(3)
      ..write(obj.call);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentsCallsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
