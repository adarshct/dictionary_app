import 'package:dictionary_app/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class AppBarArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          HomeScreen().controller.isEngToMalSelected.value
              ? "English -> മലയാളം Dictionary"
              : "മലയാളം -> English Dictionary",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.share, color: Colors.yellow),
          )
        ],
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(8, 93, 8, 0),
          child: Obx(
            () {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor:
                          HomeScreen().controller.isEngToMalSelected.value
                              ? Colors.white
                              : Colors.grey[500],
                      foregroundColor:
                          HomeScreen().controller.isEngToMalSelected.value
                              ? Colors.black
                              : Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 43),
                    ),
                    onPressed: () {
                      Get.put(TextFieldController())
                          .textEditingController
                          .clear();
                      Get.put(TextFieldController()).filterWordList.clear();

                      Get.put(ColorController()).isEngToMalSelected.value =
                          true;

                      print(HomeScreen().controller.isEngToMalSelected);
                    },
                    child: const Text(
                      "Eng->മലയാളം",
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor:
                          HomeScreen().controller.isEngToMalSelected.value
                              ? Colors.grey[500]
                              : Colors.white,
                      foregroundColor:
                          HomeScreen().controller.isEngToMalSelected.value
                              ? Colors.white
                              : Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 41),
                    ),
                    onPressed: () {
                      Get.put(TextFieldController())
                          .textEditingController
                          .clear();

                      Get.put(TextFieldController()).filterWordList.clear();
                      Get.put(ColorController()).isEngToMalSelected.value =
                          false;

                      print(HomeScreen().controller.isEngToMalSelected);
                    },
                    child: const Text(
                      "മലയാളം->Eng",
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
