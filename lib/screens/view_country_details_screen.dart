import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_search/controllers/view_country_details_controller.dart';
import 'package:country_search/utils/constants/app_text.dart';
import 'package:country_search/utils/devices/app_devices.dart';
import 'package:country_search/widgets/country_details_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewCountryDetailsScreen extends StatelessWidget {
  const ViewCountryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ViewCountryDetailsController viewCountryDetailsController =
        Get.put(ViewCountryDetailsController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          24.0,
          AppDevices.getStatusBarHeight() + 16.0,
          24.0,
          20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => viewCountryDetailsController.goTo(),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      viewCountryDetailsController.countryName.capitalizeFirst!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => CarouselSlider.builder(
                        itemCount:
                            viewCountryDetailsController.countrySlides.length,
                        itemBuilder:
                            (BuildContext context, int index, int currentIndex) {
                          return Container(
                            width: double.infinity,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.network(
                                    viewCountryDetailsController
                                            .countrySlides[index] !=
                                        ""
                                ? viewCountryDetailsController
                                    .countrySlides[index]
                                : AppText.mockImage, fit: BoxFit.cover,),
                          );
                        },
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Population:",
                          detail: viewCountryDetailsController.countryPopulation,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Region:",
                          detail: viewCountryDetailsController.countryRegion,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Capital:",
                          detail: viewCountryDetailsController.countryCapital,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Motto:",
                          detail: viewCountryDetailsController.countryMotto,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Official Language:",
                          detail: viewCountryDetailsController.countryLanguage,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Ethnic Group:",
                          detail: viewCountryDetailsController.countryEthnicGroup,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Religion:",
                          detail: viewCountryDetailsController.countryReligion,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Government:",
                          detail: viewCountryDetailsController.countryGovernment,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Independent:",
                          detail: viewCountryDetailsController.countryIndependence ? "Yes" : "No",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Area:",
                          detail: viewCountryDetailsController.countryArea,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Currency:",
                          detail: viewCountryDetailsController.countryCurrency,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "GDP:",
                          detail: viewCountryDetailsController.countryGDP,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Time zone:",
                          detail: viewCountryDetailsController.countryNameTimeZone,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Date Format:",
                          detail: viewCountryDetailsController.countryDateFormat,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Dailling code:",
                          detail: viewCountryDetailsController.countryDiallingCode,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => CountryDetailsTiles(
                          label: "Driving side:",
                          detail: viewCountryDetailsController.countryDrivingSide,
                        ),
                      ),
                    ),
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
