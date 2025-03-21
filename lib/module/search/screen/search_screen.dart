import 'package:flutter/material.dart';

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
              TextField(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                decoration: InputDecoration(
                  hintText: "Tìm kiếm",
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.color
                            ?.withOpacity(0.5),
                      ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).canvasColor.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // ===== Dòng các Tag =====
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tags
                    .map(
                      (tag) => Chip(
                        label: Text(
                          tag,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        // backgroundColor tùy theo theme
                        backgroundColor:
                            Theme.of(context).chipTheme.backgroundColor ??
                                Theme.of(context).canvasColor,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),

              // ===== Danh sách danh mục =====
              Column(
                children: categories
                    .map(
                      (cat) => ListTile(
                        title: Text(
                          cat,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onTap: () {
                          // TODO: Chuyển sang trang chi tiết danh mục
                        },
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
