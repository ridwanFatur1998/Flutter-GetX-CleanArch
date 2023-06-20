import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  int counter = 0;
  int counter2 = 1;

  void increment() {
    counter++;
    update();
  }

  void increment2() {
    counter2 = counter2 * 2;
    update();
  }

  void changeTheme() async {
    Get.changeTheme(
      Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', Get.isDarkMode ? "light" : "dark");
  }
}
