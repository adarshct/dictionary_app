import 'package:dictionary_app/Model%20Class/model_class.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> loadXlsx() async {
  ByteData data = await rootBundle.load('assets/olam-enml.xlsx');
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excelFile = Excel.decodeBytes(bytes);
  final sheet = excelFile.tables["olam-enml"];

  final dictionaryDB = await Hive.openBox<DictionaryModel>("dictionary_model");
  for (int row = 0; row < sheet!.maxRows; row++) {
    print(row);
    String id = sheet.row(row)[0] == null
        ? "-"
        : sheet.row(row)[0]!.value.toString().trim();
    String englishWord = sheet.row(row)[1] == null
        ? "-"
        : sheet.row(row)[1]!.value.toString().trim();
    String partOfSpeech = sheet.row(row)[2] == null
        ? "-"
        : sheet.row(row)[2]!.value.toString().trim();
    String malayalamDefinition = sheet.row(row)[3] == null
        ? "-"
        : sheet.row(row)[3]!.value.toString().trim();

    dictionaryDB.add(
      DictionaryModel(
          id: id,
          englishWord: englishWord,
          partOfSpeech: partOfSpeech,
          malayalamDefinition: malayalamDefinition),
    );
  }
  Future.delayed(Duration(seconds: 5));
}
// void loadXlsx() async {
//   final String csvPath = "assets/dictionary.csv";

//   final myData = await rootBundle.load(csvPath);

//   String content = utf8.decode(myData.buffer.asUint8List());

//   List<List<dynamic>> fields = const CsvToListConverter().convert(content);
  

  // for (int element = 0; element < fields.length; element++) {
  //   print(fields[element].toString());
  // }
  // Future.delayed(Duration(seconds: 5));
// }
