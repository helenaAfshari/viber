// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_buttom_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CallButtomModelAdapter
    extends TypeAdapter<CallButtomModel> {
  @override
  final int typeId = 2;

  @override
  CallButtomModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CallButtomModel(
      name: fields[0] as String,
      phone: fields[1] as String,
      imageProfile: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CallButtomModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.imageProfile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CallButtomModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
