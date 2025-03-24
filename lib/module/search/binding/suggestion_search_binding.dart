import 'package:get/get.dart';
import 'package:course_app/module/search/controller/suggestion_search_controller.dart';

class SuggestionSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuggestionSearchController>(() => SuggestionSearchController());
  }
}
