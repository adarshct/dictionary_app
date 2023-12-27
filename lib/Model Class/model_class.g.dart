// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DictionaryModelAdapter extends TypeAdapter<DictionaryModel> {
  @override
  final int typeId = 1;

  @override
  DictionaryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DictionaryModel(
      id: fields[0] as String,
      englishWord: fields[1] as String,
      partOfSpeech: fields[2] as String,
      malayalamDefinition: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DictionaryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.englishWord)
      ..writeByte(2)
      ..write(obj.partOfSpeech)
      ..writeByte(3)
      ..write(obj.malayalamDefinition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DictionaryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
