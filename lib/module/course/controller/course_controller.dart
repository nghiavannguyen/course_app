import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  @override
  void onInit() {
    final courseId = Get.parameters['id'];
    debugPrint('CourseController onInit param $courseId');
    super.onInit();
  }
}
