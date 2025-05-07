import 'package:get/get.dart';

import '../../course/fakedata/fake_data_form_json.dart';
import '../model/wish_list_model.dart';

class WishListDetailController extends GetxController {
  final course = Rxn<CourseDetail>();

  final isLoading = false.obs;

  final error = RxnString();
  final id = Get.arguments as String;

  @override
  void onInit() {
    super.onInit();

    _loadDetail(id);
  }

  void _loadDetail(String id) {
    isLoading.value = true;
    error.value = null;

    final maps = (wishListData['courses'] as List).cast<Map<String, dynamic>>();
    final jsonMap = maps.firstWhereOrNull((e) => e['id'] == id);

    if (jsonMap == null) {
      error.value = 'Không tìm thấy khóa học với id: $id';
    } else {
      course.value = CourseDetail.fromJson(jsonMap);
    }
    isLoading.value = false;
  }
}
