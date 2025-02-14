import 'package:country_search/bindings/app_bindings.dart';
import 'package:country_search/routes/app_pages.dart';
import 'package:country_search/screens/home_screen.dart';
import 'package:country_search/utils/constants/app_text.dart';
import 'package:country_search/utils/constants/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
      title: AppText.appName,
      initialBinding: AppBindings(),
      themeMode: themeController.currentTheme,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.getPages,
    ),);
  }
}
