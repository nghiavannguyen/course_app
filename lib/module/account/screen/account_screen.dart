import 'package:course_app/module/theme/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    // Nếu avatarUrl null thì lấy link dummy
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
              // ===== PHẦN THÔNG TIN NGƯỜI DÙNG =====
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Ảnh đại diện
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(imageToShow),
                    ),
                    const SizedBox(height: 12),
                    // Tên người dùng
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    // Email
                    Text(
                      userEmail,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    // "Trở thành giảng viên"
                    GestureDetector(
                      onTap: () {
                        // TODO: Xử lý logic
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

              // ===== PHẦN "TÙY CHỌN VIDEO" =====
              _buildListTile(
                context,
                title: "Tùy chọn video",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Tùy chọn tải xuống",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Tùy chọn phát lại video",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Khóa học đã tải xuống của bạn",
                onTap: () {
                  // TODO
                },
              ),

              const Divider(),

              // ===== PHẦN "CÀI ĐẶT TÀI KHOẢN" =====
              _buildListTile(
                context,
                title: "Nghề nghiệp và sở thích",
                // Gắn tag "MỚI" theo ảnh
                trailing: _buildNewTag(context),
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Thông báo đẩy",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Nhắc nhở học tập",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Thông báo email",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Bảo mật tài khoản",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Tùy chọn ngôn ngữ",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Đóng tài khoản",
                onTap: () {
                  // TODO
                },
              ),

              const Divider(),

              // ===== PHẦN "HỖ TRỢ" =====
              _buildListTile(
                context,
                title: "Giới thiệu về Udemy",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Giới thiệu về Udemy Business",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Trợ giúp & Hỗ trợ",
                onTap: () {
                  // TODO
                },
              ),
              _buildListTile(
                context,
                title: "Chia sẻ ứng dụng Udemy",
                onTap: () {
                  // TODO
                },
              ),

              const Divider(),

              // ===== Nút "Đăng xuất" =====
              _buildListTile(
                context,
                title: "Đăng xuất",
                onTap: () {
                  // TODO
                },
              ),

              // Phiên bản Udemy
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

  // ListTile chung để tái sử dụng
  Widget _buildListTile(
    BuildContext context, {
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  // Tag "MỚI"
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
