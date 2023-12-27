import 'package:dictionary_app/db_functions.dart';
import 'package:dictionary_app/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Model Class/model_class.dart';

Future<void> meaningAlertDialog(
    {required context, required String wordText}) async {
  final dictionaryDB = await Hive.openBox<DictionaryModel>("dictionary_model");

  final List<DictionaryModel> dictionaryDBList = dictionaryDB.values.toList();

  dictionaryDBList.removeAt(0);

  List<DictionaryModel> meaningList =
      Get.put(ColorController()).isEngToMalSelected.value
          ? dictionaryDBList
              .where((element) =>
                  element.englishWord.trim().toLowerCase() ==
                  wordText.trim().toLowerCase())
              .toList()
          : dictionaryDBList
              .where((element) =>
                  element.malayalamDefinition.trim().toLowerCase() ==
                  wordText.trim().toLowerCase())
              .toList();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.fromLTRB(11, 22, 11, 11),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(0),
        content: Builder(
          builder: (_) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.lightBlue,
                    ),
                    height: 60,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        BackButton(color: Colors.white),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "'$wordText' Meaning",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: SelectableText(wordText),
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      child: meaningList.isNotEmpty
                          ? ListView.builder(
                              itemBuilder: (context, index) {
                                Get.put(ColorController())
                                        .isEngToMalSelected
                                        .value
                                    ? addToEnglishHistoryDB(
                                        englishWord: wordText)
                                    : addToMalayalamHistoryDB(
                                        malayalamWord: wordText);
                                return ListTile(
                                  title: SelectableText(
                                    Get.put(ColorController())
                                            .isEngToMalSelected
                                            .value
                                        ? meaningList[index].malayalamDefinition
                                        : meaningList[index].englishWord,
                                  ),
                                  trailing: Get.put(ColorController())
                                          .isEngToMalSelected
                                          .value
                                      ? Text(
                                          "(${meaningList[index].partOfSpeech})",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        )
                                      : SizedBox(),
                                );
                              },
                              itemCount: meaningList.length,
                            )
                          : Center(
                              child: Text(
                                "No Meaning Available For $wordText",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
