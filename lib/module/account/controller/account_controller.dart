import 'package:course_app/core/di/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

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


    

     
  }

  Future<void> logout() async {
    // await sl<AppHive>().deleteData('user_id');
    // await sl<AppHive>().deleteData('access_token');
    userInfo.clear();
  }
}
