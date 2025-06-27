import 'package:core_theme/core_theme.dart';
import 'package:core_ui/core_ui.dart';
import 'package:course_app/module/auth/controller/login_controller.dart';
import 'package:course_app/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimens.spacing4),
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIcon(Icons.web, BorderRadius.circular(AppDimens.radius8), theme),
                          const SizedBox(width: AppDimens.spacing12),
                          _buildIcon(Icons.email_outlined, BorderRadius.circular(AppDimens.radius8),
                              theme),
                        ],
                      ),
                      const SizedBox(height: AppDimens.spacing6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIcon(Icons.code, BorderRadius.circular(AppDimens.radius48), theme),
                          const SizedBox(width: AppDimens.spacing12),
                          _buildIcon(Icons.camera_alt_outlined, BorderRadius.zero, theme),
                          const SizedBox(width: AppDimens.spacing12),
                          _buildIcon(
                              Icons.language, BorderRadius.circular(AppDimens.radius48), theme),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Đăng nhập để tiếp tục hành trình học tập của bạn',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: AppDimens.spacing12),
              AppTextField(
                controller: controller.emailController,
                label: "Email",
                prefixIcon: const Icon(Icons.email_outlined),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppDimens.spacing4),
              Obx(
                () => AppTextField(
                  controller: controller.passwordController,
                  label: "Mật khẩu",
                  prefixIcon: const Icon(Icons.lock_outline),
                  textInputAction: TextInputAction.done,
                  obscureText: controller.isPasswordHidden.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      controller.isPasswordHidden.toggle();
                    },
                  ),
                ),
              ),
              const SizedBox(height: AppDimens.spacing6),
              Obx(
                () => AppButton(
                  borderRadius: BorderRadius.circular(8),

                  backgroundColor: theme.colorScheme.primary,

                  // Giữ nguyên hàm xử lý khi nhấn nút

                  onPressed: () {
                    // Đây là nơi bạn sẽ gọi hàm login từ controller

                    // final result = await controller.login(...);

                    // ... xử lý kết quả

                    // Tạm thời dùng điều hướng để demo

                    Get.toNamed(Routes.root);
                  },

                  // Liên kết trạng thái của button với biến isLoading trong controller

                  state:
                      controller.isLoading.value ? AppButtonState.loading : AppButtonState.normal,

                  // Sử dụng kiểu primary cho hành động chính

                  type: AppButtonType.primary,

                  // Để button chiếm toàn bộ chiều rộng

                  isFullWidth: true,

// Nội dung của button giờ đây chỉ cần là Text

                  child: const Text('Đăng nhập'),
                ),
              ),
              const SizedBox(height: AppDimens.spacing6),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Hoặc đăng nhập bằng',
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: AppDimens.spacing4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLoginOption(
                          'assets/icons/google-icon.png',
                          () {},
                          theme,
                        ),
                        const SizedBox(width: AppDimens.spacing6),
                        _buildLoginOption(
                          'assets/icons/apple-icon.png',
                          () {},
                          theme,
                          color: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppDimens.spacing6),
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
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 134,
                  height: AppDimens.spacing1,
                  margin: const EdgeInsets.only(bottom: AppDimens.spacing2),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(AppDimens.radius100),
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
      width: AppDimens.avatarSizeXLarge,
      height: AppDimens.avatarSizeXLarge,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: borderRadius,
        border: Border.all(
          color: theme.colorScheme.onSurface,
          width: AppDimens.dividerThicknessMedium,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          color: theme.colorScheme.onSurface,
          size: AppDimens.icon24,
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
        width: AppDimens.avatarSizeXLarge,
        height: AppDimens.avatarSizeXLarge,
        padding: const EdgeInsets.all(AppDimens.spacing2),
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.outline,
            width: AppDimens.dividerThicknessMedium,
          ),
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            color: color,
            width: AppDimens.icon32,
            height: AppDimens.icon32,
          ),
        ),
      ),
    );
  }

  void _handleLogin(LoginController controller) async {
    final result = await controller.login(
      controller.emailController.text,
      controller.passwordController.text,
    );

    // result.fold(
    //   (error) {
    //     Get.snackbar(
    //       'Đăng nhập thất bại',
    //       error,
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red,
    //       colorText: Colors.white,
    //     );
    //   },
    //   (success) {
    //     Get.offAllNamed(Routes.root);
    //   },
    // );
  }
}
