// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modalForThis.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class whatsappAdapter extends TypeAdapter<whatsapp> {
  @override
  final int typeId = 0;

  @override
  whatsapp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return whatsapp(
      name: fields[0] as String?,
      subtext: fields[1] as String?,
      phoneNumber: fields[2] as int?,
      image: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, whatsapp obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.subtext)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is whatsappAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
