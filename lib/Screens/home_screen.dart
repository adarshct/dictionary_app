import 'package:dictionary_app/Screens/body_area.dart';
import 'package:dictionary_app/Screens/bottom_area.dart';
import 'package:dictionary_app/app_drawer.dart';
import 'package:dictionary_app/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appbar_area.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(ColorController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103),
        child: AppBarArea(),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 120),
            child: BodyArea(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomArea(),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
