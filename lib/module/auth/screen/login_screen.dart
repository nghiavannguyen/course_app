import 'package:core_ui/core_ui.dart';
import 'package:course_app/module/auth/controller/login_controller.dart';
import 'package:course_app/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              AppButton(
                onPressed: () {
                  
                },
                padding: EdgeInsets.symmetric(vertical: 16),
                isFullWidth: true,
                state: AppButtonState.loading,
                child: Text("Log in"),
              ),
              // Close button
              IconButton(
                icon: Icon(Icons.close, color: theme.textTheme.headlineMedium?.color, size: 32),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),

              // Khu vực icon minh họa
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIcon(
                              Icons.web, BorderRadius.circular(8), theme),
                          const SizedBox(width: 48),
                          _buildIcon(Icons.email_outlined,
                              BorderRadius.circular(8), theme),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIcon(
                              Icons.code, BorderRadius.circular(50), theme),
                          const SizedBox(width: 48),
                          _buildIcon(Icons.camera_alt_outlined,
                              BorderRadius.zero, theme),
                          const SizedBox(width: 48),
                          _buildIcon(
                              Icons.language, BorderRadius.circular(50), theme),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Tiêu đề
              Center(
                child: Text(
                  'Đăng nhập để tiếp tục hành trình học tập của bạn',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium,
                ),
              ),

              const SizedBox(height: 48),

              // Trường Email
              // CommonTextfieldWidget(
              //   label: "Email",
              //   controller: controller.emailController,
              // ),

              // const SizedBox(height: 16),

              // // Trường mật khẩu
              // Obx(() => CommonTextfieldWidget(
              //       label: "Mật khẩu",
              //       controller: controller.passwordController,
              //       obscureText: controller.isPasswordHidden.value,
              //       textInputAction: TextInputAction.done,
              //       showToggleObscureIcon: true,
              //       onSuffixTap: () {
              //         controller.isPasswordHidden.toggle();
              //       },
              //     )),

              const SizedBox(height: 24),

              // Nút đăng nhập
              Obx(() {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Get.toNamed(Routes.root);
                      Logger().d("LOG ABC");

                      final result = await controller.login(
                        controller.emailController.text.trim(),
                        controller.passwordController.text.trim(),
                      );
                      result.fold(
                        (error) {
                          // Handle error
                          Logger().d("Error: $error");
                          Get.showSnackbar(
                            GetSnackBar(
                              title: 'Thông báo',
                              message: error,
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        (success) {
                          if (success) {
                            Get.offAllNamed(Routes.root);
                          }
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? CircularProgressIndicator.adaptive()
                        : Text(
                            'Đăng nhập',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                );
              }),

              const SizedBox(height: 24),

              // Tuỳ chọn khác
              Center(
                child: Column(
                  children: [
                    Text(
                      'Hoặc đăng nhập bằng',
                      style: TextStyle(color: Colors.grey),
                    ),
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
                  ],
                ),
              ),

              const Spacer(),

              // Đăng ký nếu chưa có tài khoản
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn chưa có tài khoản? ",
                        style: theme.textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.signUp);
                        },
                        child: Text(
                          'Đăng ký',
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

              // Đường kẻ dưới cùng
              Center(
                child: Container(
                  width: 100,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, BorderRadius borderRadius, ThemeData theme) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: borderRadius,
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

  Widget _buildLoginOption(
    String iconPath,
    VoidCallback onTap,
    ThemeData theme, {
    Color? color,
  }) {
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
}
