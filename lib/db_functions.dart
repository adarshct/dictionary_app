import 'package:dictionary_app/Model%20Class/malayalam_history_model.dart';
import 'package:dictionary_app/getx_controller.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Model Class/english_history_model.dart';
import 'Model Class/model_class.dart';

final textFieldValueController = Get.put(TextFieldController());

final radioController = Get.put(RadioController());

void englishFilter() async {
  final dictionaryDB = await Hive.openBox<DictionaryModel>("dictionary_model");

  final List<DictionaryModel> dictionaryDBList = dictionaryDB.values.toList();

    dictionaryDBList.removeAt(0);


  if (!textFieldValueController.valueIsEmpty.value) {
    radioController.radioText.value == "StartsWith"
        ? textFieldValueController.filterWordList.value = dictionaryDBList
            .where((element) => element.englishWord.toLowerCase().startsWith(
                textFieldValueController.textFieldValue.value
                    .trim()
                    .toLowerCase()))
            .toList()
        : radioController.radioText.value == "Contains"
            ? textFieldValueController.filterWordList.value = dictionaryDBList
                .where((element) => element.englishWord.toLowerCase().contains(
                    textFieldValueController.textFieldValue.value
                        .trim()
                        .toLowerCase()))
                .toList()
            : textFieldValueController.filterWordList.value = dictionaryDBList
                .where(
                    (element) => element.englishWord.toLowerCase().endsWith(textFieldValueController.textFieldValue.value.trim().toLowerCase()))
                .toList();
  }
}

void malayalamFilter() async {
  final dictionaryDB = await Hive.openBox<DictionaryModel>("dictionary_model");

  final List<DictionaryModel> dictionaryDBList = dictionaryDB.values.toList();

  dictionaryDBList.removeAt(0);

  if (!textFieldValueController.valueIsEmpty.value) {
    radioController.radioText.value == "StartsWith"
        ? textFieldValueController.filterWordList.value = dictionaryDBList
            .where((element) => element.malayalamDefinition.startsWith(
                textFieldValueController.textFieldValue.value.trim()))
            .toList()
        : radioController.radioText.value == "Contains"
            ? textFieldValueController.filterWordList.value = dictionaryDBList
                .where((element) => element.malayalamDefinition.contains(
                    textFieldValueController.textFieldValue.value.trim()))
                .toList()
            : textFieldValueController.filterWordList.value = dictionaryDBList
                .where((element) => element.malayalamDefinition.endsWith(
                    textFieldValueController.textFieldValue.value.trim()))
                .toList();
  }
}

void addToEnglishHistoryDB({required String englishWord}) async {
  final englishHistoryDB =
      await Hive.openBox<EnglishHistory>("english_history");
  englishHistoryDB.add(EnglishHistory(englishHistoryWord: englishWord));
}

void addToMalayalamHistoryDB({required String malayalamWord}) async {
  final malayalamHistoryDB =
      await Hive.openBox<MalayalamHistory>("malayalam_history");
  malayalamHistoryDB.add(MalayalamHistory(malayalamHistoryWord: malayalamWord));
}

void englishHistoryList() async {
  final englishHistoryDB =
      await Hive.openBox<EnglishHistory>("english_history");

  if (englishHistoryDB.isNotEmpty) {
    for (int element = 0; element < englishHistoryDB.length; element++) {
      Get.put(History())
          .englishHistoryList
          .add(englishHistoryDB.getAt(element)!.englishHistoryWord);
    }

    Get.put(History()).englishHistoryList.value =
        Get.put(History()).englishHistoryList.reversed.toList();
    Set<String> myEnglishSet =
        Set<String>.from(Get.put(History()).englishHistoryList);
    Get.put(History()).englishHistoryList.value = myEnglishSet.toList();
  }
}

void malayalamHistoryList() async {
  final malayalamHistoryDB =
      await Hive.openBox<MalayalamHistory>("malayalam_history");

  if (malayalamHistoryDB.isNotEmpty) {
    for (int element = 0; element < malayalamHistoryDB.length; element++) {
      Get.put(History())
          .malayalamHistoryList
          .add(malayalamHistoryDB.getAt(element)!.malayalamHistoryWord);
    }

    Get.put(History()).malayalamHistoryList.value =
        Get.put(History()).malayalamHistoryList.reversed.toList();
    Set<String> myMalayalamSet =
        Set<String>.from(Get.put(History()).malayalamHistoryList);
    Get.put(History()).malayalamHistoryList.value = myMalayalamSet.toList();
  }
}
