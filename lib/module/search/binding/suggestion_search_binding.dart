import 'package:get/get.dart';
import 'package:course_app/module/search/controller/suggestion_search_controller.dart';

import '../service/course_service.dart';

class SuggestionSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseService());
    Get.lazyPut<SuggestionSearchController>(() => SuggestionSearchController());
  }
}
