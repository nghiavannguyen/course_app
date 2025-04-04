import 'package:course_app/module/course/binding/detail_course_binding.dart';
import 'package:course_app/module/course/screen/detail_course_screen.dart';
import 'package:course_app/module/search/binding/suggestion_search_binding.dart';
import 'package:course_app/module/search/screen/result_search_screen.dart';
import 'package:course_app/module/search/screen/suggestion_search_screen.dart';
import 'package:course_app/module/signup/binding/sign_up_binding.dart';
import 'package:course_app/navigation/routes.dart';
import 'package:course_app/module/auth/screen/login_screen.dart';
import 'package:course_app/module/course/binding/course_binding.dart';
import 'package:course_app/module/course/screen/course_screen.dart';
import 'package:course_app/module/search/screen/search_screen.dart';
import 'package:course_app/root.dart';
import 'package:get/get.dart';

import '../module/signup/screen/signup_screen.dart';

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
      name: Routes.signUp,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.resultSearch,
      page: () => const ResultSearchScreen(),
    ),
    GetPage(
        name: '${Routes.course}/:id',
        page: () => const CourseScreen(),
        binding: CourseBinding()),
    GetPage(
        name: "${Routes.detailCourse}/:id",
        page: () => DetailCourseScreen(),
        binding: DetailCourseBinding()),
  ];
}
