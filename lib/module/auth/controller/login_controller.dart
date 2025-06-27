import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final isPasswordHidden = true.obs;
  final isRememberMe = true.obs;

  Future<void> login(String username, String password) async {
    final username = emailController.text.trim();
    final password = passwordController.text.trim();
    isLoading.value = true;
  }
}
