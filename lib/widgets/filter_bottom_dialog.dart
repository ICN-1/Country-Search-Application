import 'package:country_search/controllers/filter_controller.dart';
import 'package:country_search/widgets/filter_button.dart';
import 'package:country_search/widgets/filter_tiles_check_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';
import '../utils/constants/app_colours.dart';

class FilterBottomDialog extends StatelessWidget {
  const FilterBottomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    FilterController filterController = Get.put(FilterController());
    ThemeController themeController = Get.put(ThemeController());

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Filter",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: filterController.goBack,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 14.0),
                      child: Icon(
                        Icons.close,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Continent",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () => filterController.onSelectContinents(
                                filterController.isContinentOpened),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 14.0),
                              child: Icon(
                                filterController.isContinentOpened
                                    ? Icons.expand_less_rounded
                                    : Icons.expand_more_rounded,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    filterController.isContinentOpened
                        ? Obx(
                            () => Column(
                              children: filterController.continentsList
                                  .map<Widget>((continent) {
                                return Column(
                                  children: [
                                    FilterTilesCheckBox(
                                      text: continent[0]
                                          .toString()
                                          .capitalizeFirst!,
                                      isChecked:
                                          filterController.continentsList[
                                              filterController.continentsList
                                                  .indexOf(continent)][1],
                                      onChecked: (lang) =>
                                          filterController.selectContinent(
                                              continent[1],
                                              filterController.continentsList
                                                  .indexOf(continent)),
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    )
                                  ],
                                );
                              }).toList(),
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Time Zone",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () => filterController.onSelectTimeZone(
                                filterController.isTimeZoneOpened),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 14.0),
                              child: Icon(
                                filterController.isTimeZoneOpened
                                    ? Icons.expand_less_rounded
                                    : Icons.expand_more_rounded,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    filterController.isTimeZoneOpened
                        ? Obx(
                            () => Column(
                              children: filterController.timeZonesList
                                  .map<Widget>((timeZone) {
                                return Column(
                                  children: [
                                    FilterTilesCheckBox(
                                      text: timeZone[0]
                                          .toString()
                                          .capitalizeFirst!,
                                      isChecked: timeZone[1],
                                      onChecked: (lang) =>
                                          filterController.selectTimeZone(
                                              timeZone[1],
                                              filterController.timeZonesList
                                                  .indexOf(timeZone)),
                                    ),
                                    const SizedBox(height: 16.0)
                                  ],
                                );
                              }).toList(),
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FilterButton(
                            width: 100.0,
                            borderColor: themeController.currentTheme == ThemeMode.light ? AppColours.black : AppColours.white,
                            text: "Reset",
                            onPress: () => filterController.onResetFilter(),
                          ),
                          FilterButton(
                            width: 200.0,
                            textColor: AppColours.white,
                            borderColor: AppColours.orange,
                            backgroundColor: AppColours.orange,
                            text: "Show Results",
                            onPress: () => filterController.onSetFilter(),
                          ),
                        ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
