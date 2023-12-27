// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'malayalam_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MalayalamHistoryAdapter extends TypeAdapter<MalayalamHistory> {
  @override
  final int typeId = 3;

  @override
  MalayalamHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MalayalamHistory(
      malayalamHistoryWord: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MalayalamHistory obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.malayalamHistoryWord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MalayalamHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
