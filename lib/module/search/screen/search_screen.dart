import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:course_app/module/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  // Danh sách từ khóa tìm kiếm (tags)
  final List<String> tags = const [
    "python",
    "excel",
    "java",
    "sql",
    "digital marketing",
    "power bi",
    "javascript",
    "c#",
    "photoshop",
    "react",
  ];

  // Danh sách danh mục
  final List<String> categories = const [
    "Kinh doanh",
    "CNTT & Phần mềm",
    "Phát triển",
    "Tài chính & Kế toán",
    "Quản trị văn phòng",
    "Thiết kế",
    "Marketing",
    "Phong cách sống",
    "Nhiếp ảnh & Video",
    "Sức khoẻ & thể chất",
    "Âm nhạc",
    "Giảng dạy & Học thuật",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Màu nền theo theme (thường là đen ở DarkTheme)
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Thanh tìm kiếm =====
              SearchWidget(),
              const SizedBox(height: 16),
              // ===== Dòng các Tag =====
              Wrap(
                spacing: 8,
                runSpacing: 0,
                children: tags
                    .map(
                      (tag) => Chip(
                        visualDensity: VisualDensity.compact,
                        labelPadding: EdgeInsets.zero,
                        label: Text(tag, style: context.bodySmall),
                        // backgroundColor tùy theo theme
                        backgroundColor: context.background,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 8),

              // ===== Danh sách danh mục =====
              Column(
                children: categories
                    .map(
                      (cat) => ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onTap: () {
                          // TODO: Chuyển sang trang chi tiết danh mục
                          print(cat);
                          AppToast.show(cat, type: ToastType.success, context: context);
                        },
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          cat,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: context.iconColor,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
