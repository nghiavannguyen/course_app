import 'package:course_app/config/routes.dart';
import 'package:course_app/module/auth/screen/login_screen.dart';
import 'package:course_app/module/search/binding/suggestion_search_binding.dart';
import 'package:course_app/module/search/screen/search_screen.dart';
import 'package:course_app/module/search/screen/suggestion_search_screen.dart';
import 'package:course_app/root.dart';
import 'package:get/get.dart';

import '../module/search/screen/result_search_screen.dart';

class AppPage {
  static List<GetPage> pages = [
    GetPage(name: Routes.login, page: () => const LoginScreen(), bindings: []),
    GetPage(
      name: Routes.root,
      page: () => const RootApp(),
    ),
    GetPage(
      name: Routes.search,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: Routes.suggestionSearch,
      page: () => const SuggestionSearchScreen(),
      binding: SuggestionSearchBinding(),
    ),
    GetPage(
      name: Routes.resultSearch,
      page: () => const ResultSearchScreen(),
    ),
  ];
}
