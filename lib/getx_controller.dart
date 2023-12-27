import 'package:dictionary_app/Model%20Class/model_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  RxBool isEngToMalSelected = true.obs;
}

class RadioController extends GetxController {
  RxInt groupValue = 1.obs;
  RxString radioText = "StartsWith".obs;
}

class TextFieldController extends GetxController {
  RxBool valueIsEmpty = true.obs;
  RxString textFieldValue = "".obs;
  final textEditingController = TextEditingController();

  RxList<DictionaryModel> filterWordList = <DictionaryModel>[].obs;
}

class History extends GetxController {
  RxList englishHistoryList = <String>[].obs;
  RxList malayalamHistoryList = <String>[].obs;
}

class Voice extends GetxController {
  RxBool isIconClicked = false.obs;
}
