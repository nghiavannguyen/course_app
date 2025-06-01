import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:either_dart/either.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/network/dio_client.dart';

class RegisterResult {
  final bool isSuccess;
  final String? message;

  const RegisterResult({required this.isSuccess, this.message});
}

class SignUpController extends GetxController {
  RxBool receiveOffers = true.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordHidden = true.obs;
  final isLoading = false.obs;

  /// Gọi từ UI, xử lý logic, trả kết quả
  Future<RegisterResult> onRegister() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return RegisterResult(
        isSuccess: false,
        message: "Vui lòng nhập đầy đủ thông tin",
      );
    }

    final result =
        await register(email, password, receiveOffers: receiveOffers.value);

    return result.fold(
      (error) => RegisterResult(isSuccess: false, message: error),
      (success) => RegisterResult(isSuccess: true),
    );
  }

  /// Gửi API đăng ký
  Future<Either<String, bool>> register(String email, String password,
      {bool receiveOffers = false}) async {
    isLoading.value = true;

    try {
      final res = await sl<DioClient>().dio.post(
        '/auth/register',
        data: {
          "email": email,
          "password": password,
          "name": email,
          "role": "student",
          "receiveOffers": receiveOffers,
        },
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

        if (code == 400 || code == 409) {
          return Left("Email đã được sử dụng. Vui lòng dùng email khác.");
        }

        return Left("Lỗi server: $code");
      }

      return Left("Lỗi hệ thống không xác định");
    } catch (e) {
      return Left("Đã xảy ra lỗi, vui lòng thử lại sau");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
