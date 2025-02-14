import 'package:country_search/controllers/languages_controller.dart';
import 'package:country_search/widgets/filter_tiles_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesBottomDialog extends StatelessWidget {
  const LanguagesBottomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController = Get.put(LanguagesController());

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Languages",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: languagesController.goBack,
                child: const Padding(
                  padding: EdgeInsets.only(right: 14.0),
                  child: Icon(
                    Icons.close,
                    size: 24.0,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: languagesController.allLanguages.length,
                itemBuilder: (context, index) {
                  final language = languagesController.allLanguages[index];
      
                  return Column(
                    children: [
                      Obx(() => FilterTilesRadioButton(
                        text: language.capitalizeFirst!,
                        value: language.toLowerCase(),
                        selectedValue: languagesController.selectedLanguage,
                        onChanged: (lang) => languagesController.onSelectLanguage(lang!.toLowerCase()),
                      ),),
                      const SizedBox(
                        height: 24.0,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
