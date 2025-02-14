import 'dart:convert';
import 'package:country_search/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FilterController extends GetxController {
  @override
  void onInit() {
    getAllTimeZones();

    super.onInit();
  }

  final RxBool _isContinentOpened = false.obs;
  bool get isContinentOpened => _isContinentOpened.value;

  final RxList<dynamic> _continentsList = <dynamic>[
    ["Africa", false],
    ["Antarctica", false],
    ["Asia", false],
    ["Australia", false],
    ["Europe", false],
    ["North America", false],
    ["South America", false],
  ].obs;
  List<dynamic> get continentsList => _continentsList;

  final RxBool _isTimeZoneOpened = false.obs;
  bool get isTimeZoneOpened => _isTimeZoneOpened.value;

  final RxList<dynamic> _timeZonesList = <dynamic>[].obs;
  List<dynamic> get timeZonesList => _timeZonesList;

  void onSelectContinents(bool isOpened) {
    _isContinentOpened.value = !isOpened;
  }

  void onSelectTimeZone(bool isOpened) {
    _isTimeZoneOpened.value = !isOpened;
  }

  Future<void> getAllTimeZones() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> countries = json.decode(response.body);
      Set<String> timeZonesSet = {};

      for (var country in countries) {
        if (country['timezones'] != null) {
          List<dynamic> zones = country['timezones'];
          timeZonesSet.addAll(zones.map((e) => e.toString()));
        }
      }

      _timeZonesList.value = timeZonesSet.map((zone) => [zone, false]).toList();
    }
  }

  void onSetFilter() {
    List<String> continentFils = [""];
    List<String> timeZoneFils = [""];
    continentsList.forEach((con) {
      if (con[1] == true) {
        continentFils.add(con[0]);
      }
    });

    timeZonesList.forEach((zone) {
      if (zone[1] == true) {
        timeZoneFils.add(zone[0]);
      }
    });

    HomeController homeController = Get.put(HomeController());
    homeController.filterCountryList(continentFils, timeZoneFils);
    Get.back();
  }

  void onResetFilter() {
    continentsList.forEach((con) {
      con[1] = false;
    });

    timeZonesList.forEach((zone) {
      zone[1] = false;
    });
    HomeController homeController = Get.put(HomeController());
    homeController.onRestA();
  }

  void selectContinent(bool state, int index) {
    _continentsList[index][1] = !state;
    _continentsList.refresh();
  }

  void selectTimeZone(bool state, int index) {
    _timeZonesList[index][1] = !state;
    _timeZonesList.refresh();
  }

  void goBack() {
    Get.back();
  }
}
