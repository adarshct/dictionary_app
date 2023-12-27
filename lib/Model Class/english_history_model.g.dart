// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'english_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnglishHistoryAdapter extends TypeAdapter<EnglishHistory> {
  @override
  final int typeId = 2;

  @override
  EnglishHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnglishHistory(
      englishHistoryWord: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EnglishHistory obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.englishHistoryWord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnglishHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
