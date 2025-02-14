import 'dart:convert';

import 'package:country_search/controllers/home_controller.dart';
import 'package:country_search/routes/app_routes.dart';
import 'package:country_search/utils/constants/app_text.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ViewCountryDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    HomeController homeController = Get.put(HomeController());
    _countryName.value = homeController.selectedCountry;
    getCountryDetails(homeController.selectedCountry);
  }

  void beginM() {
    HomeController homeController = Get.put(HomeController());
    _countryName.value = homeController.selectedCountry;
    getCountryDetails(homeController.selectedCountry);
  }

  final RxList<String> _countrySlides = <String>[
    AppText.mockImage,
    AppText.mockImage,
    AppText.mockImage,
  ].obs;
  List<String> get countrySlides => _countrySlides;

  final RxString _countryName = "".obs;
  String get countryName => _countryName.value;

  final RxString _countryPopulation = "".obs;
  String get countryPopulation => _countryPopulation.value;

  final RxString _countryRegion = "Garri".obs;
  String get countryRegion => _countryRegion.value;

  final RxString _countryCapital = "".obs;
  String get countryCapital => _countryCapital.value;

  final RxString _countryMotto = "".obs;
  String get countryMotto => _countryMotto.value;

  final RxString _countryLanguage = "".obs;
  String get countryLanguage => _countryLanguage.value;

  final RxString _countryEthnicGroup = "".obs;
  String get countryEthnicGroup => _countryEthnicGroup.value;

  final RxString _countryReligion = "".obs;
  String get countryReligion => _countryReligion.value;

  final RxString _countryGovernment = "".obs;
  String get countryGovernment => _countryGovernment.value;

  final RxBool _countryIndependence = false.obs;
  bool get countryIndependence => _countryIndependence.value;

  final RxString _countryArea = "".obs;
  String get countryArea => _countryArea.value;

  final RxString _countryCurrency = "".obs;
  String get countryCurrency => _countryCurrency.value;

  final RxString _countryGDP = "".obs;
  String get countryGDP => _countryGDP.value;

  final RxString _countryNameTimeZone = "".obs;
  String get countryNameTimeZone => _countryNameTimeZone.value;

  final RxString _countryDataFormat = "".obs;
  String get countryDateFormat => _countryDataFormat.value;

  final RxString _countryDiallingCode = "".obs;
  String get countryDiallingCode => _countryDiallingCode.value;

  final RxString _countryDrivingSide = "".obs;
  String get countryDrivingSide => _countryDrivingSide.value;

  void goTo() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }

  Future<void> getCountryDetails(name) async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/name/$name'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      var countryDetails = json.decode(response.body)[0];
      _countrySlides.value = [
        countryDetails["flags"]["png"] ?? AppText.mockImage,
        countryDetails["coatOfArms"]["png"] ?? AppText.mockImage,
      ];

      _countryPopulation.value =
          countryDetails["population"].toString();
      _countryRegion.value = countryDetails["region"] ?? "Unknown";
      _countryCapital.value = countryDetails["capital"]?[0] ?? "Unknown";
      _countryMotto.value = countryDetails["motto"] ?? "Unknown";
      _countryLanguage.value = countryDetails["languages"]?.entries.first.value ?? "Unknown";
      _countryEthnicGroup.value = countryDetails["ethnicGroups"] ?? "Unknown";
      _countryReligion.value =
          countryDetails["religion"]?.join(', ') ?? "Unknown";
      _countryGovernment.value = countryDetails["government"] ?? "Unknown";
      _countryIndependence.value = countryDetails["independent"] ?? "Unknown";
      _countryArea.value = countryDetails["area"]?.toString() ?? "Unknown";
      _countryCurrency.value =
          countryDetails["currencies"]?.keys?.first ?? "Unknown";
      _countryGDP.value = countryDetails["gdp"] ?? "Unknown";
      _countryNameTimeZone.value =
          countryDetails["timezones"]?.take(2).join(', ') ?? "Unknown";
      _countryDataFormat.value = countryDetails["dateFormat"] ?? "Unknown";
      _countryDiallingCode.value = "${countryDetails["idd"]?["root"] ?? "Unknown"}${countryDetails["idd"]?["suffixes"]?[0] ?? ""}";
      _countryDrivingSide.value =
          countryDetails["car"]?["side"] ?? "Unknown";
    }
  }
}
