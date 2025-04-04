import 'package:course_app/module/theme/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sub_project/common/widget/alert_dialog/alert_dialog_base.dart';

import '../../../navigation/routes.dart' show Routes;

class AccountScreen extends StatelessWidget {
  final String? avatarUrl;
  final String userName;
  final String userEmail;

  const AccountScreen({
    super.key,
    this.avatarUrl,
    this.userName = "Nghĩa Nguyễn Văn",
    this.userEmail = "vannghia31zz@gmail.com",
  });

  @override
  Widget build(BuildContext context) {
    final String imageToShow =
        avatarUrl ?? "https://avatar.iran.liara.run/public";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài khoản"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(imageToShow),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userEmail,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        final themeController = Get.find<ThemeController>();
                        themeController.toggleTheme();
                      },
                      child: Text(
                        "Trở thành giảng viên",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              _buildListTile(context,
                  title: "Nghề nghiệp và sở thích",
                  trailing: _buildNewTag(context),
                  onTap: () {}),
              _buildListTile(context, title: "Thông báo đẩy", onTap: () {}),
              _buildListTile(context, title: "Nhắc nhở học tập", onTap: () {}),
              _buildListTile(context, title: "Thông báo email", onTap: () {}),
              _buildListTile(context, title: "Bảo mật tài khoản", onTap: () {}),
              _buildListTile(context, title: "Tùy chọn ngôn ngữ", onTap: () {}),
              _buildListTile(context, title: "Đóng tài khoản", onTap: () {}),
              const Divider(),
              _buildListTile(
                context,
                title: "Đăng xuất",
                onTap: () => AlertDialogBase.showCommonAlertDialog(
                  context,
                  title: "Đăng xuất",
                  content: "Bạn có chắc chắn muốn đăng xuất không?",
                  confirmText: "Đăng xuất",
                  cancelText: "Hủy",
                  onConfirm: () {
                    Get.offAllNamed(Routes.login);
                  },
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Udemy v8.82.0.2899",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required String title, Widget? trailing, required VoidCallback onTap}) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildNewTag(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "MỚI",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
