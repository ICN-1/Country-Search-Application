import 'package:country_search/controllers/filter_controller.dart';
import 'package:country_search/controllers/home_controller.dart';
import 'package:country_search/controllers/languages_controller.dart';
import 'package:country_search/controllers/theme_controller.dart';
import 'package:country_search/controllers/view_country_details_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
    Get.lazyPut(
      () => ViewCountryDetailsController(),
    );
    Get.lazyPut(
      () => LanguagesController(),
    );
    Get.lazyPut(
      () => FilterController(),
    );
    Get.lazyPut(
      () => ThemeController(),
    );
  }
}
