import 'package:country_search/screens/home_screen.dart';
import 'package:country_search/screens/view_country_details_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
    ),

    GetPage(
      name: AppRoutes.viewCountryDetailsScreen,
      page: () => const ViewCountryDetailsScreen(),
    ),
  ];
}