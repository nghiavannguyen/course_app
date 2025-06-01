// views/sign_up_screen.dart
import 'package:course_app/module/signup/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigation/routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, size: 32),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIcon(Icons.web, BorderRadius.circular(8), theme),
                          const SizedBox(width: 48),
                          _buildIcon(Icons.email_outlined, BorderRadius.circular(8), theme),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIcon(Icons.code, BorderRadius.circular(50), theme),
                          const SizedBox(width: 48),
                          _buildIcon(Icons.camera_alt_outlined, BorderRadius.zero, theme),
                          const SizedBox(width: 48),
                          _buildIcon(Icons.language, BorderRadius.circular(50), theme),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Đăng ký để tận dụng tối đa việc học của bạn",
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              // CommonTextfieldWidget(
              //     label: "Email", controller: controller.emailController),
              // const SizedBox(height: 8),
              // Obx(() => CommonTextfieldWidget(
              //       label: "Mật khẩu",
              //       controller: controller.passwordController,
              //       obscureText: controller.isPasswordHidden.value,
              //       textInputAction: TextInputAction.done,
              //       showToggleObscureIcon: true,
              //       onSuffixTap: () {
              //         controller.isPasswordHidden.toggle();
              //       },
              // )),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: controller.receiveOffers.value,
                          onChanged: (value) => controller.receiveOffers.value = value ?? false,
                        ),
                      )),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Gửi cho tôi các ưu đãi đặc biệt, đề xuất cá nhân hóa và bí quyết học tập.",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _handleRegister,
                  icon: const Icon(Icons.email),
                  label: const Text("Đăng ký"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text("Các tùy chọn đăng ký khác", style: theme.textTheme.bodyMedium),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLoginOption(
                    'assets/icons/google-icon.png',
                    () {},
                    theme,
                  ),
                  const SizedBox(width: 24),
                  _buildLoginOption(
                    'assets/icons/apple-icon.png',
                    () {},
                    theme,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text: "Bằng cách đăng ký, bạn đồng ý với ",
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: "Điều khoản sử dụng",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const TextSpan(text: " và "),
                    TextSpan(
                      text: "Thông báo về quyền riêng tư",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bạn đã có tài khoản chưa? ", style: theme.textTheme.bodyMedium),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.login);
                        },
                        child: Text(
                          "Đăng nhập",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, BorderRadius radius, ThemeData theme) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: radius,
        border: Border.all(
          color: theme.textTheme.headlineMedium?.color ?? Colors.white,
          width: 1,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          color: theme.textTheme.headlineMedium?.color,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildLoginOption(String iconPath, VoidCallback onTap, ThemeData theme, {Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.textTheme.headlineMedium?.color ?? Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            color: color,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }

  void _handleRegister() async {
    final controller = Get.find<SignUpController>();
    final result = await controller.onRegister();

    if (!result.isSuccess) {
      Get.snackbar(
        "Lỗi",
        result.message ?? "Đăng ký thất bại",
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    Get.snackbar(
      "Thành công",
      "Đăng ký thành công",
      snackPosition: SnackPosition.TOP,
    );
    Get.offNamed(Routes.login);
  }
}
