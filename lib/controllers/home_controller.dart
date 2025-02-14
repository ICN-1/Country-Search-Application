import 'dart:convert';
import 'package:country_search/controllers/view_country_details_controller.dart';
import 'package:country_search/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  @override
  void onInit() {
    getAllCountries();

    super.onInit();
  }

  TextEditingController searchController = TextEditingController();

  final RxList<dynamic> _originalList = [].obs;
  List<dynamic> get originalList => _originalList;

  final RxList<dynamic> _countryList = [].obs;
  List<dynamic> get countryList => _countryList;

  final RxList<dynamic> _sortedCountryList = [].obs;
  List<dynamic> get sortedCountryList => _sortedCountryList;

  final RxString _selectedCountry = "nigeria".obs;
  String get selectedCountry => _selectedCountry.value;

  Future<void> getAllCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    if (response.statusCode == 200) {
      _countryList.value = json.decode(response.body);
      _originalList.value = countryList;
      _sortedCountryList.value = countryList;
      sortCountries();
    }
  }

  void onRestA() {
    _countryList.value = originalList;
    Get.back();
  }

  void sortCountries() {
    final groupedMap = <String, List<dynamic>>{};

    for (var country in sortedCountryList) {
      final firstLetter = country["name"]["official"][0].toUpperCase();
      if (!groupedMap.containsKey(firstLetter)) {
        groupedMap[firstLetter] = [];
      }

      groupedMap[firstLetter]?.add(country);
    }

    groupedMap.forEach((key, value) {
      value.sort(
          (a, b) => a["name"]["official"].compareTo(b["name"]["official"]));
    });

    var sortedGroupedList = groupedMap.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    _sortedCountryList.value = sortedGroupedList
        .map((entry) => {
              "letter": entry.key,
              "countries": entry.value,
            })
        .toList();
  }

  void filterCountryList(List<String> continents, List<String> timezone) {
    // List<Map<String, dynamic>> filteredCountries = [];
    // for (var country in countryList) {
    //   bool matchesContinent =
    //       continents.isEmpty || continents.contains(country["continent"]);
    //   bool matchesTimeZone = timezone.isEmpty ||
    //       country["timezones"].any((zone) => timezone.contains(zone));
    //   if (matchesContinent && matchesTimeZone) {
    //     filteredCountries.add(country);
    //   }
    // }
    // _countryList.value = filteredCountries;
  }

  void filterCountries(String search) {
    final filtered = countryList.where((country) {
      return country['name']['official']
          .toLowerCase()
          .contains(search.toLowerCase());
    }).toList();
    _sortedCountryList.value = filtered;
    sortCountries();
  }

  void onSelectCountry(String countryName) {
    _selectedCountry.value = countryName.toLowerCase();
    ViewCountryDetailsController viewCountryDetailsController =
        Get.put(ViewCountryDetailsController());
    viewCountryDetailsController.beginM();
    Get.toNamed(
      AppRoutes.viewCountryDetailsScreen,
    );
  }
}
