import "package:avatar_glow/avatar_glow.dart";
import "package:dictionary_app/db_functions.dart";

import "package:dictionary_app/getx_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:speech_to_text/speech_to_text.dart";
import "package:translator/translator.dart";

class SpeechToTextClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AvatarGlow(
        animate: Get.put(Voice()).isIconClicked.value,
        endRadius: 30,
        child: InkWell(
          child: Get.put(Voice()).isIconClicked.value
              ? Icon(
                  Icons.keyboard_voice,
                  color: Colors.white,
                )
              : Icon(
                  Icons.keyboard_voice_outlined,
                  color: Colors.white,
                ),
          onTap: () async {
            !Get.put(Voice()).isIconClicked.value
                ? Get.put(Voice()).isIconClicked.value = true
                : Get.put(Voice()).isIconClicked.value = false;

            if (Get.put(Voice()).isIconClicked.value) {
              SpeechToText speechToText = SpeechToText();

              bool available = await speechToText.initialize();

              if (available) {
                speechToText.listen(
                  listenFor: Duration(seconds: 7),
                  onResult: (result) async {
                    if (Get.put(ColorController()).isEngToMalSelected.value) {
                      Get.put(TextFieldController())
                          .textEditingController
                          .text = result.recognizedWords;

                      Get.put(TextFieldController()).valueIsEmpty.value = false;
                      Get.put(TextFieldController()).textFieldValue.value =
                          result.recognizedWords;

                      englishFilter();
                    } else {
                      Get.put(TextFieldController())
                          .textEditingController
                          .clear();
                      final translator = GoogleTranslator();
                      Translation translation = await translator.translate(
                        result.recognizedWords,
                        from: 'en',
                        to: 'ml',
                      );

                      Get.put(TextFieldController())
                          .textEditingController
                          .text = translation.text;

                      Get.put(TextFieldController()).valueIsEmpty.value = false;
                      Get.put(TextFieldController()).textFieldValue.value =
                          translation.text;

                      malayalamFilter();
                    }
                  },
                );
              }
              Future.delayed(Duration(seconds: 7), () {
                Get.put(Voice()).isIconClicked.value = false;
              });
            }
          },
        ),
      ),
    );
  }
}
