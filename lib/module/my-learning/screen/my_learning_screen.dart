import 'package:course_app/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({super.key});

  // Danh sách khoá học mô phỏng
  final List<MyLearningCourse> courses = const [
    MyLearningCourse(
      title: "Python OOP : Object Oriented Programming in Python",
      author: "Deepali Srivastava",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Start course",
    ),
    MyLearningCourse(
      title: "Machine Learning Code Crash Course",
      author: "Naman Singhal",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Start course",
    ),
    MyLearningCourse(
      title: "Advanced Python: Real-World Programming Deep Dive (2025)",
      author:
          "Sai All | Technical Architect (6x AWS Certified), Marti Cs, AxOps ArchOps",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Start course",
    ),
    MyLearningCourse(
      title: "Beginners Guide To Graphic Design Without Paid Software",
      author: "Greg Gottfried",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Start course",
    ),
    MyLearningCourse(
      title: "Introduction to iOS 11 Development: Swift 4 and Xcode 9",
      author: "Max Codes, The Codex",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Start course",
    ),
    MyLearningCourse(
      title: "Multimedia Journalism",
      author: "Climate Tracker",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Start course",
    ),
    MyLearningCourse(
      title: "155 Years of Copywriting Insights Taught In 1.5 Hour Course!",
      author: "Eric John Campbell",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Start course",
    ),
    MyLearningCourse(
      title: "Secret Sauce of Great Presentations",
      author: "Alex Harris",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Start course",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar với tiêu đề "My learning"
      appBar: AppBar(
        title: const Text("My learning"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Xử lý search
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Xử lý filter
            },
          ),
        ],
      ),
      // Màu nền lấy từ theme (Dark/Light)
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final item = courses[index];
          return ListTile(
            // Ảnh đại diện khoá học
            leading: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
            // Tiêu đề (tên khoá học)
            title: Text(
              item.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            // Tác giả
            subtitle: Text(
              item.author,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            // Nút "Start course"
            trailing: Text(
              item.actionText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            onTap: () {
              // TODO: Xử lý khi chọn khoá học
              Get.toNamed("${Routes.detailCourse}/0123");
            },
          );
        },
      ),
    );
  }
}

// ===================================================================
// MODEL: MyLearningCourse
// ===================================================================
class MyLearningCourse {
  final String title;
  final String author;
  final String imageUrl;
  final String actionText;

  const MyLearningCourse({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.actionText,
  });
}
