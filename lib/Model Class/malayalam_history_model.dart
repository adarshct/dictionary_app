import 'package:hive_flutter/hive_flutter.dart';
part 'malayalam_history_model.g.dart';

@HiveType(typeId: 3)
class MalayalamHistory {
  @HiveField(0)
  String malayalamHistoryWord;

  MalayalamHistory({required this.malayalamHistoryWord});
}
