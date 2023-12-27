import 'package:hive_flutter/hive_flutter.dart';
part 'model_class.g.dart';

@HiveType(typeId: 1)
class DictionaryModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String englishWord;

  @HiveField(2)
  String partOfSpeech;

  @HiveField(3)
  String malayalamDefinition;

  DictionaryModel({
    required this.id,
    required this.englishWord,
    required this.partOfSpeech,
    required this.malayalamDefinition,
  });
}
