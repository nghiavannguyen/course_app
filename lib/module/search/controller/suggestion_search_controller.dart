// lib/module/search/controller/suggestion_search_controller.dart
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../service/course_service.dart';

class SuggestionSearchController extends GetxController {
  final CourseService _service = Get.find();
  final suggestions = <CourseSuggestion>[].obs;
  final isLoading = false.obs;
  final error = RxnString();

  late final CancelToken _cancelToken;
  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    _cancelToken = CancelToken();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    if (!_cancelToken.isCancelled) _cancelToken.cancel();
    super.onClose();
  }

  // /// Gọi API gợi ý, debounce 300ms
  // void fetchSuggestions(String query) {
  //   _debounce?.cancel();
  //   _debounce = Timer(Duration(milliseconds: 300), () async {
  //     final q = query.trim();
  //     if (q.isEmpty) {
  //       suggestions.clear();
  //       error.value = null;
  //       return;
  //     }
  //     isLoading.value = true;
  //     error.value = null;

  //     final result = await _service.searchCourses(q, cancelToken: _cancelToken);
  //     isLoading.value = false;

  //     result.fold(
  //       (e) => error.value = e,
  //       (list) {
  //         suggestions.assignAll(list);
  //       },
  //     );
  //   });
  // }
}
