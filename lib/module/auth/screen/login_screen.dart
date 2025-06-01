import 'package:core_ui/core_ui.dart';
import 'package:course_app/module/auth/controller/login_controller.dart';
import 'package:course_app/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loginController = Get.find<LoginController>();

    return Scaffold(
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

              // Icons section
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
                      const SizedBox(height: 24),
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

              // Login text
              Center(
                child: Text(
                  'Log in to continue your\nlearning journey',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium,
                ),
              ),

              const SizedBox(height: 48),

              // Email field
              TextField(
                style: theme.textTheme.bodyLarge,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.textTheme.bodyLarge?.color ?? Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Login button
              Obx(() {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Get.toNamed(Routes.root);
                      Logger().d("LOG ABC");

                      final result = await loginController.login("ad@gmail.com", "nghia1");
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
                          // Handle success
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
                    child: loginController.isLoading.value
                        ? CircularProgressIndicator.adaptive()
                        : Text(
                            'Log in',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                );
              }),

              const SizedBox(height: 24),

              // Other login options
              Center(
                child: Column(
                  children: [
                    Text(
                      'Other login options',
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

              // Sign up text
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: theme.textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Sign up',
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

              // Bottom indicator
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
        border: Border.all(color: theme.textTheme.headlineMedium?.color ?? Colors.white, width: 1),
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
          border:
              Border.all(color: theme.textTheme.headlineMedium?.color ?? Colors.white, width: 1),
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
