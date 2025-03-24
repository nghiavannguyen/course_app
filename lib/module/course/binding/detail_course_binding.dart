import 'package:course_app/module/course/controller/detail_course_controller.dart';
import 'package:get/get.dart';

class DetailCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailCourseController());
  }
}
