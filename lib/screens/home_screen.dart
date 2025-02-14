import 'package:country_search/controllers/home_controller.dart';
import 'package:country_search/controllers/theme_controller.dart';
import 'package:country_search/utils/constants/app_colours.dart';
import 'package:country_search/utils/devices/app_devices.dart';
import 'package:country_search/widgets/filter_bottom_dialog.dart';
import 'package:country_search/widgets/languages_bottom_dialog.dart';
import 'package:country_search/widgets/search_tab.dart';
import 'package:country_search/widgets/search_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          24.0,
          AppDevices.getStatusBarHeight() + 20.0,
          24.0,
          20.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () => themeController.toggleTheme(),
                    child: Icon(
                      themeController.currentTheme == ThemeMode.light
                          ? Icons.wb_sunny_outlined
                          : Icons.dark_mode_outlined,
                      size: 32.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            SearchTab(
              controller: homeController.searchController,
              icon: Icons.search_rounded,
              iconSize: 32.0,
              hint: "Search Country",
              onSearch: (search) => homeController
                  .filterCountries(homeController.searchController.text),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      enableDrag: false,
                      builder: (BuildContext context) {
                        return const LanguagesBottomDialog();
                      },
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.language,
                        size: 24.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 3.0,
                        ),
                        child: Text(
                          'EN',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      enableDrag: false,
                      builder: (BuildContext context) {
                        return const FilterBottomDialog();
                      },
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.filter_alt_outlined,
                        size: 24.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 3.0,
                        ),
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Obx(() {
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: homeController.sortedCountryList.length,
                  itemBuilder: (context, sectionIndex) {
                    final group =
                        homeController.sortedCountryList[sectionIndex];
                    final letter = group["letter"];
                    final countries = group["countries"];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            letter,
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: AppColours.dark2),
                          ),
                        ),
                        Column(
                          children: countries.map<Widget>((country) {
                            return Column(
                              children: [
                                SearchTiles(
                                  image: country["flags"] != null
                                      ? country["flags"]["png"]
                                      : "",
                                  countryName: country["name"] != null
                                      ? country["name"]["official"]
                                      : "Country name",
                                  countryCapital: country["capital"] != null
                                      ? country["capital"][0]
                                      : "Country capital",
                                  onSelect: () => homeController
                                      .onSelectCountry(country["name"] != null
                                          ? country["name"]["official"]
                                          : "nigeria"),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
