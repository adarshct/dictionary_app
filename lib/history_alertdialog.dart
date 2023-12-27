import 'package:dictionary_app/db_functions.dart';
import 'package:dictionary_app/getx_controller.dart';
import 'package:dictionary_app/meaning_alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> historyAlertDialog({required BuildContext context}) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.all(10),
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
                          child: Get.put(ColorController())
                                  .isEngToMalSelected
                                  .value
                              ? Text(
                                  "English History",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )
                              : Text(
                                  "മലയാളം History",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () {
                      englishHistoryList();
                      malayalamHistoryList();

                      return Expanded(
                        child: Get.put(ColorController())
                                .isEngToMalSelected
                                .value
                            ? ListView.builder(
                                itemCount: Get.put(History())
                                    .englishHistoryList
                                    .length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      title: Text(Get.put(History())
                                          .englishHistoryList[index]),
                                      tileColor: Colors.blue[100],
                                      onTap: () {
                                        meaningAlertDialog(
                                            context: context,
                                            wordText: Get.put(History())
                                                .englishHistoryList[index]);
                                      },
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: Get.put(History())
                                    .malayalamHistoryList
                                    .length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      title: Text(Get.put(History())
                                          .malayalamHistoryList[index]),
                                      tileColor: Colors.blue[100],
                                      onTap: () {
                                        meaningAlertDialog(
                                            context: context,
                                            wordText: Get.put(History())
                                                .malayalamHistoryList[index]);
                                      },
                                    ),
                                  );
                                },
                              ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
