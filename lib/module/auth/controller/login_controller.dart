import 'package:course_app/core/di/service_locator.dart';
import 'package:course_app/core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:sub_project/core/util/helper/logger.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<Either<String, bool>> login(String username, String password) async {
    isLoading.value = true;

    try {
      final res = await sl<DioClient>().dio.post(
        '/auth/login',
        data: {"username": username, "password": password},
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        return Right(true);
      } else {
        return Left("Đã xảy ra lỗi không xác định");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Left("Mất kết nối. Vui lòng kiểm tra Internet.");
      }

      if (e.type == DioExceptionType.badResponse) {
        final code = e.response?.statusCode;
        Logger.log(runtimeType, "❌ API Error $code: ${e.response?.data}");

        if (code == 400 || code == 401) {
          return Left("Sai tài khoản hoặc mật khẩu");
        }

        return Left("Lỗi server: $code");
      }

      return Left("Lỗi hệ thống không xác định");
    } catch (e) {
      Logger.log(runtimeType, "❗ Exception: $e");
      return Left("Đã xảy ra lỗi, vui lòng thử lại sau");
    } finally {
      isLoading.value = false;
    }
  }
}
