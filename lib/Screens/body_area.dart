import 'package:dictionary_app/meaning_alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx_controller.dart';

class BodyArea extends StatelessWidget {
  final textFieldValueController = Get.put(TextFieldController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<String> wordSuggestionList = [];

      for (int element = 0;
          element < textFieldValueController.filterWordList.length;
          element++) {
        Get.put(ColorController()).isEngToMalSelected.value
            ? wordSuggestionList.add(
                textFieldValueController.filterWordList[element].englishWord)
            : wordSuggestionList.add(textFieldValueController
                .filterWordList[element].malayalamDefinition);
      }

      Set<String> mySet = Set<String>.from(wordSuggestionList);
      wordSuggestionList = mySet.toList();
      wordSuggestionList.sort((a, b) => a.length.compareTo(b.length));

      return ListView.builder(
        itemBuilder: (context, index) => Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            tileColor: Colors.white,
            title: Text(
              wordSuggestionList[index],
            ),
            onTap: () {
              meaningAlertDialog(
                  context: context, wordText: wordSuggestionList[index]);
            },
          ),
        ),
        itemCount: wordSuggestionList.length,
      );
    });
  }
}
