import 'package:dictionary_app/Screens/home_screen.dart';
import 'package:dictionary_app/meaning_alertdialog.dart';
import 'package:dictionary_app/speech_to_text.dart';
import 'package:dictionary_app/warning_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../db_functions.dart';
import '../getx_controller.dart';
import '../history_alertdialog.dart';

class BottomArea extends StatelessWidget {
  final radioController = Get.put(RadioController());

  final textFieldValueController = Get.put(TextFieldController());

  BottomArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          Container(
            height: 70,
            color: Theme.of(context).colorScheme.primary,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      historyAlertDialog(context: context);
                    },
                    icon: const Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width:
                        textFieldValueController.valueIsEmpty.value ? 275 : 225,
                    child: TextField(
                      controller:
                          Get.put(TextFieldController()).textEditingController,

                      // inputFormatters:
                      //     HomeScreen().controller.isEngToMalSelected.value
                      //         ? [
                      //             FilteringTextInputFormatter.allow(
                      //               RegExp("[a-zA-Z ]"),
                      //             ),
                      //           ]
                      //         : [
                      //             FilteringTextInputFormatter.allow(
                      //               RegExp("[\u0D00-\u0D7F ]"),
                      //               //RegExp(r'^[ം-ഃ\u200D\u200C\u0D00-\u0D7F\s]*$'),
                      //             ),
                      //           ],

                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (Get.put(ColorController())
                              .isEngToMalSelected
                              .value) {
                            RegExp allowedCharactersEng = RegExp(r"[a-zA-Z]");

                            if (!allowedCharactersEng.hasMatch(value)) {
                              Get.put(TextFieldController())
                                  .textEditingController
                                  .text = value.substring(0, value.length - 1);

                              warningPopUp(
                                  context: context, language: "English");

                              value = Get.put(TextFieldController())
                                  .textEditingController
                                  .text;
                            }
                          } else {
                            RegExp allowedCharactersMl =
                                RegExp("[\u0D00-\u0D7F]");
                            if (!allowedCharactersMl.hasMatch(value)) {
                              Get.put(TextFieldController())
                                  .textEditingController
                                  .text = value.substring(0, value.length - 1);

                              warningPopUp(
                                  context: context, language: "Malayalam");

                              value = Get.put(TextFieldController())
                                  .textEditingController
                                  .text;
                            }
                          }
                        }

                        value.isEmpty
                            ? textFieldValueController.valueIsEmpty.value = true
                            : textFieldValueController.valueIsEmpty.value =
                                false;

                        textFieldValueController.textFieldValue.value = value;

                        if (value.isEmpty) {
                          textFieldValueController.filterWordList.clear();
                        }

                        Get.put(ColorController()).isEngToMalSelected.value
                            ? englishFilter()
                            : malayalamFilter();
                      },
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText:
                            HomeScreen().controller.isEngToMalSelected.value
                                ? "Type English Word"
                                : "മലയാളത്തിൽ ടൈപ്പ് ചെയ്യുക",
                      ),
                    ),
                  ),
                  Get.put(TextFieldController()).valueIsEmpty.value
                      ? SpeechToTextClass()
                      : Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.put(TextFieldController())
                                    .textEditingController
                                    .clear();

                                Get.put(TextFieldController())
                                    .filterWordList
                                    .clear();

                                textFieldValueController.valueIsEmpty.value =
                                    true;
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                meaningAlertDialog(
                                    context: context,
                                    wordText: textFieldValueController
                                        .textFieldValue.value);
                              },
                              icon: Icon(
                                Icons.check_box_outlined,
                                color: Colors.lightGreenAccent[400],
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                bottomRadioButton(
                    context: context,
                    titleText: "StartsWith",
                    value: 1,
                    radioOnChanged: (val) {
                      radioController.groupValue.value = val!;
                      radioController.radioText.value = "StartsWith";
                      Get.put(ColorController()).isEngToMalSelected.value
                          ? englishFilter()
                          : malayalamFilter();
                    }),
                bottomRadioButton(
                    context: context,
                    titleText: "Contains",
                    value: 2,
                    radioOnChanged: (val) {
                      radioController.groupValue.value = val!;
                      radioController.radioText.value = "Contains";
                      Get.put(ColorController()).isEngToMalSelected.value
                          ? englishFilter()
                          : malayalamFilter();
                    }),
                bottomRadioButton(
                    context: context,
                    titleText: "EndsWith",
                    value: 3,
                    radioOnChanged: (val) {
                      radioController.groupValue.value = val!;
                      radioController.radioText.value = "EndsWith";
                      Get.put(ColorController()).isEngToMalSelected.value
                          ? englishFilter()
                          : malayalamFilter();
                    }),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomRadioButton({
    required BuildContext context,
    required String titleText,
    required int value,
    required void Function(int?) radioOnChanged,
  }) {
    return Expanded(
      flex: 4,
      child: Obx(
        () => RadioListTile(
          fillColor: MaterialStateColor.resolveWith(
            (states) => Theme.of(context).colorScheme.primary,
          ),
          dense: true,
          visualDensity: const VisualDensity(horizontal: -4),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            titleText,
            style: const TextStyle(fontSize: 12),
          ),
          value: value,
          groupValue: radioController.groupValue.value,
          onChanged: radioOnChanged,
        ),
      ),
    );
  }
}
