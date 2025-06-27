import 'package:core_ui/core_ui.dart';
import 'package:core_theme/core_theme.dart';
import 'package:course_app/module/signup/controller/sign_up_controller.dart';
import 'package:course_app/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.spacing6,
            vertical: AppDimens.spacing4,
          ),
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
                          _buildIcon(Icons.web,
                              BorderRadius.circular(AppDimens.radius8), theme),
                          const SizedBox(width: AppDimens.spacing12),
                          _buildIcon(Icons.email_outlined,
                              BorderRadius.circular(AppDimens.radius8), theme),
                        ],
                      ),
                      const SizedBox(height: AppDimens.spacing6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIcon(Icons.code,
                              BorderRadius.circular(AppDimens.radius48), theme),
                          const SizedBox(width: AppDimens.spacing12),
                          _buildIcon(Icons.camera_alt_outlined,
                              BorderRadius.zero, theme),
                          const SizedBox(width: AppDimens.spacing12),
                          _buildIcon(Icons.language,
                              BorderRadius.circular(AppDimens.radius48), theme),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppDimens.spacing4),
              Text(
                "Đăng ký để tận dụng tối đa việc học của bạn",
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppDimens.spacing3),
              AppTextField(
                  controller: controller.emailController, label: "Email"),
              const SizedBox(height: AppDimens.spacing3), // 12
              Obx(
                () => AppTextField(
                  controller: controller.passwordController,
                  label: "Mật khẩu",
                  prefixIcon: const Icon(Icons.lock_outline),
                  textInputAction: TextInputAction.done,
                  obscureText: controller.isPasswordHidden.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      controller.isPasswordHidden.toggle();
                    },
                  ),
                ),
              ),
              const SizedBox(height: AppDimens.spacing4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => SizedBox(
                        height: AppDimens.icon24,
                        width: AppDimens.icon24,
                        child: Checkbox(
                          value: controller.receiveOffers.value,
                          onChanged: (value) =>
                              controller.receiveOffers.value = value ?? false,
                        ),
                      )),
                  const SizedBox(width: AppDimens.spacing2),
                  Expanded(
                    child: Text(
                      "Gửi cho tôi các ưu đãi đặc biệt, đề xuất cá nhân hóa và bí quyết học tập.",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.spacing4),
              AppButton(
                borderRadius: BorderRadius.circular(AppDimens.radius8),
                backgroundColor: theme.colorScheme.primary,
                onPressed: _handleRegister,
                type: AppButtonType.primary,
                isFullWidth: true,
                child: const Text(
                  "Đăng ký",
                ),
              ),
              const SizedBox(height: AppDimens.spacing6),
              Text("Các tùy chọn đăng ký khác",
                  style: theme.textTheme.bodyMedium),
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
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.spacing4),
              Text.rich(
                TextSpan(
                  text: "Bằng cách đăng ký, bạn đồng ý với ",
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: "Điều khoản sử dụng",
                      style: TextStyle(
                        color: theme.primaryTextTheme.bodySmall?.color,
                      ),
                    ),
                    const TextSpan(text: " và "),
                    TextSpan(
                      text: "Thông báo về quyền riêng tư",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppDimens.spacing6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bạn đã có tài khoản chưa? ",
                          style: theme.textTheme.bodyMedium),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.login);
                        },
                        child: Text(
                          "Đăng nhập",
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, BorderRadius radius, ThemeData theme) {
    return Container(
      width: AppDimens.avatarSizeXLarge,
      height: AppDimens.avatarSizeXLarge,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: radius,
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

  Widget _buildLoginOption(String iconPath, VoidCallback onTap, ThemeData theme,
      {Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimens.avatarSizeXLarge,
        height: AppDimens.avatarSizeXLarge,
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.outline,
            width: AppDimens.dividerThicknessMedium,
          ),
          borderRadius: BorderRadius.circular(AppDimens.radius4),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            color: color,
            width: AppDimens.icon24,
            height: AppDimens.icon24,
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
