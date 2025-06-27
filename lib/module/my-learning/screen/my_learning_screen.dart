import 'package:course_app/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({super.key});

  // Danh sách khoá học mô phỏng
  final List<MyLearningCourse> courses = const [
    MyLearningCourse(
      title: "Lập trình hướng đối tượng với Python",
      author: "Deepali Srivastava",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Bắt đầu học",
    ),
    MyLearningCourse(
      title: "Khoá học cấp tốc về Machine Learning",
      author: "Naman Singhal",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Bắt đầu học",
    ),
    MyLearningCourse(
      title: "Python nâng cao: Lập trình thực tế chuyên sâu (2025)",
      author:
          "Sai All | Kỹ sư trưởng (6x AWS Certified), Marti Cs, AxOps ArchOps",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Bắt đầu học",
    ),
    MyLearningCourse(
      title:
          "Hướng dẫn thiết kế đồ họa cho người mới, không cần phần mềm trả phí",
      author: "Greg Gottfried",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Bắt đầu học",
    ),
    MyLearningCourse(
      title: "Nhập môn lập trình iOS 11 với Swift 4 và Xcode 9",
      author: "Max Codes, The Codex",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Bắt đầu học",
    ),
    MyLearningCourse(
      title: "Báo chí đa phương tiện",
      author: "Climate Tracker",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Bắt đầu học",
    ),
    MyLearningCourse(
      title: "155 năm tinh hoa Copywriting chỉ trong 1.5 giờ học!",
      author: "Eric John Campbell",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Bắt đầu học",
    ),
    MyLearningCourse(
      title: "Bí quyết tạo nên bài thuyết trình tuyệt vời",
      author: "Alex Harris",
      imageUrl: "https://dummyimage.com/60",
      actionText: "Bắt đầu học",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar với tiêu đề tiếng Việt
      appBar: AppBar(
        title: const Text("Khóa học của tôi"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Xử lý tìm kiếm
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Xử lý lọc danh sách
            },
          ),
        ],
      ),

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final item = courses[index];
          return ListTile(
            leading: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
            title: Text(
              item.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Text(
              item.author,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              item.actionText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            onTap: () {
              // Điều hướng đến màn chi tiết khoá học (giả định)
              Get.toNamed("${Routes.detailCourse}/0123");
            },
          );
        },
      ),
    );
  }
}

// MODEL: MyLearningCourse
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
