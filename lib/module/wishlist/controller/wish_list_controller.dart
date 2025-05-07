import 'package:get/get.dart';
import '../../course/fakedata/fake_data_form_json.dart';
import '../model/wish_list_model.dart';

class WishListController extends GetxController {
  final courses = <CourseDetail>[].obs;
  final isLoading = false.obs;
  final error = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadCourses();
  }

  void loadCourses() {
    isLoading(true);
    error.value = null;
    try {
      final list = (wishListData['courses'] as List)
          .map((e) => CourseDetail.fromJson(e))
          .toList();
      courses.assignAll(list);
    } catch (e) {
      error.value = 'Lỗi parse dữ liệu: $e';
    } finally {
      isLoading(false);
    }
  }

  CourseDetail? findById(String id) {
    return courses.firstWhereOrNull((c) => c.id == id);
  }
}
