import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:course_app/core/di/service_locator.dart';
import 'package:course_app/core/network/dio_client.dart';
import 'package:course_app/core/storage/app_hive.dart';
import 'package:sub_project/core/util/helper/logger.dart';

class AccountController extends GetxController {
  final isLoading = true.obs;
  final userInfo = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    isLoading.value = true;

    final userId = sl<AppHive>().getData('user_id');
    final token = sl<AppHive>().getData('access_token');

    if (userId == null || token == null) {
      Logger.log(
          runtimeType, "⚠️ Không tìm thấy user_id hoặc token trong Hive");
      Get.snackbar(
          'Lỗi', 'Thông tin đăng nhập không hợp lệ. Vui lòng đăng nhập lại.');
      isLoading.value = false;
      return;
    }

    try {
      final res = await sl<DioClient>().dio.get(
            '/user/$userId',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          );

      if (res.statusCode == 200 && res.data['data'] != null) {
        userInfo.value = res.data['data'];
        Logger.log(runtimeType, "✅ Lấy thông tin user thành công");
      } else {
        Logger.log(runtimeType,
            "⚠️ Lỗi dữ liệu từ API: ${res.statusCode} - ${res.data}");
        Get.snackbar('Lỗi', 'Không thể tải thông tin người dùng');
      }
    } on DioException catch (e) {
      Logger.log(runtimeType, "❌ DioException: ${e.message}");
      Get.snackbar('Lỗi', 'Lỗi mạng hoặc máy chủ không phản hồi');
    } catch (e) {
      Logger.log(runtimeType, "❗ Exception: $e");
      Get.snackbar('Lỗi', 'Đã xảy ra lỗi không xác định');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await sl<AppHive>().deleteData('user_id');
    await sl<AppHive>().deleteData('access_token');
    userInfo.clear();

    Logger.log(runtimeType, "👋 Đăng xuất, xoá dữ liệu local");
  }
}
