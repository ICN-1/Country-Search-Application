import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LanguagesController extends GetxController {
  @override
  void onInit() {
    getAllLanguages();

    super.onInit();
  }

  final RxString _selectedLanguage = "".obs;
  String get selectedLanguage => _selectedLanguage.value;

  final RxList<String> _allLanguages = <String>[].obs;
  List<String> get allLanguages => _allLanguages;

  Future<void> getAllLanguages() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> countries = json.decode(response.body);
      Set<String> languageSet = {};

      for (var country in countries) {
        if (country['languages'] != null) {
          Map<String, dynamic> languages = country['languages'];
          languageSet.addAll(languages.values.map((e) => e.toString()));
        }
      }

      _allLanguages.value = languageSet.toList();
      if (_allLanguages.isNotEmpty) {
        _selectedLanguage.value = _allLanguages[0].toLowerCase();
      }
    }
  }

  void onSelectLanguage(String lang) {
    _selectedLanguage.value = lang.toLowerCase();
  }

  void goBack() {
    Get.back();
  }
}
