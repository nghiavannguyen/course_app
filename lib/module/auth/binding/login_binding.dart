import 'package:course_app/module/auth/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // For example: Get.lazyPut<YourController>(() => YourController());
    Get.put<LoginController>(LoginController());
  }
}
