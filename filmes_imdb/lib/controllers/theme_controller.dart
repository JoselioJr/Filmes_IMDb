import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {
  final RxBool isDarkMode = false.obs;
  late Box _themeBox;

  @override
  void onInit() {
    super.onInit();
    _initTheme();
  }

  Future<void> _initTheme() async {
    _themeBox = await Hive.openBox('theme');
    isDarkMode.value = _themeBox.get('isDarkMode', defaultValue: false);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _themeBox.put('isDarkMode', isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      );

  ThemeData get darkTheme => ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      );
}