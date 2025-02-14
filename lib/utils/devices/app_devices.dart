import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDevices {
  AppDevices._();
  
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getDeviceWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double getDeviceHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static dynamic getSystemTheme() {
    return MediaQuery.of(Get.context!).platformBrightness;
  }
}
