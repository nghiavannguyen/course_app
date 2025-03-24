import 'package:course_app/module/course/controller/course_controller.dart';
import 'package:get/get.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CourseController());
  }
}
