import 'package:hive_flutter/hive_flutter.dart';
part 'english_history_model.g.dart';

@HiveType(typeId: 2)
class EnglishHistory {
  @HiveField(0)
  String englishHistoryWord;

  EnglishHistory({required this.englishHistoryWord});
}
