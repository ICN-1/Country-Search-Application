import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  @override
  void onInit() {
    loadSavedTheme();

    super.onInit();
  }

  void loadSavedTheme() {
    _currentTheme.value = ThemeMode.system;
  }

  final Rx<ThemeMode> _currentTheme = ThemeMode.light.obs;
  ThemeMode get currentTheme => _currentTheme.value;

  void toggleTheme() {
    if (currentTheme == ThemeMode.light) {
      _currentTheme.value = ThemeMode.dark;
    } else {
      _currentTheme.value = ThemeMode.light;
    }
  }
}
