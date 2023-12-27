import 'package:dictionary_app/Model%20Class/english_history_model.dart';
import 'package:dictionary_app/Model%20Class/malayalam_history_model.dart';
import 'package:dictionary_app/Model%20Class/model_class.dart';
import 'package:dictionary_app/excel_to_list_function.dart';
import 'package:dictionary_app/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DictionaryModelAdapter().typeId)) {
    Hive.registerAdapter(DictionaryModelAdapter());
  }

  if (!Hive.isAdapterRegistered(EnglishHistoryAdapter().typeId)) {
    Hive.registerAdapter(EnglishHistoryAdapter());
  }

  if (!Hive.isAdapterRegistered(MalayalamHistoryAdapter().typeId)) {
    Hive.registerAdapter(MalayalamHistoryAdapter());
  }

  final dictionaryDB = await Hive.openBox<DictionaryModel>("dictionary_model");

  if (dictionaryDB.isEmpty) {
    loadXlsx();
  }

  runApp(const DictionaryApp());
}

class DictionaryApp extends StatelessWidget {
  const DictionaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: HomeScreen().controller.isEngToMalSelected.value
                  ? Colors.blue
                  : Colors.black),
        ),
      ),
    );
  }
}
