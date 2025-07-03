import 'package:core_theme/core_theme.dart';
import 'package:course_app/core/navigation/routes.dart';
import 'package:course_app/module/home/components/category_chip.dart';
import 'package:course_app/module/home/components/course_card.dart';
import 'package:course_app/module/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ===== DỮ LIỆU MẪU CHO DEMO =====
  final List<CourseModel> shortAndSweetCourses = const [
    CourseModel(
      imageUrl:
          'https://lh3.googleusercontent.com/-nMO5UrXH7Ag/YG6k5BMteZI/AAAAAAAAnAM/5FbE1FwrynIWcuWmyGtk0zPJ-dxiqS4zgCLcBGAsYHQ/w433-h244/image.png',
      title: "Scikit-learn với Python: 100+ Dự án Khoa học Dữ liệu",
      author: "Pawel Krakowiak",
      rating: 4.7,
      ratingCount: 96,
      price: "₫249,000",
      oldPrice: "₫799,000",
      isBestseller: true,
    ),
    CourseModel(
      imageUrl:
          "https://lh3.googleusercontent.com/-nMO5UrXH7Ag/YG6k5BMteZI/AAAAAAAAnAM/5FbE1FwrynIWcuWmyGtk0zPJ-dxiqS4zgCLcBGAsYHQ/w433-h244/image.png",
      title: "Phân đoạn Video với Python bằng Deep Learning",
      author: "Tiến sĩ Angela M & Cộng sự",
      rating: 4.6,
      ratingCount: 66,
      price: "₫249,000",
      oldPrice: "₫499,000",
      isBestseller: false,
    ),
  ];

  final List<CourseModel> learnersAreViewing = const [
    CourseModel(
      imageUrl: 'https://i.ytimg.com/vi/pDmSX2rBrww/maxresdefault.jpg',
      title: "100 Ngày Code: Khóa học Python Pro Toàn diện",
      author: "Tiến sĩ Angela Yu, Lập trình viên ...",
      rating: 4.7,
      ratingCount: 325785,
      price: "₫249,000",
      oldPrice: "₫1,499,000",
      isBestseller: true,
    ),
    CourseModel(
      imageUrl: 'https://i.ytimg.com/vi/pDmSX2rBrww/maxresdefault.jpg',
      title: "Bootcamp Phát triển Web Full-Stack Toàn diện",
      author: "Tiến sĩ Angela Yu, Lập trình viên ...",
      rating: 4.7,
      ratingCount: 425628,
      price: "₫249,000",
      oldPrice: "₫1,499,000",
      isBestseller: true,
    ),
  ];

  final List<String> categories = const [
    "Tiếp thị",
    "Kinh doanh",
    "CNTT & Phần mềm",
    "Phát triển phần mềm",
    "Tài chính & Kế toán",
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== PHẦN 1: Khóa học ngắn gọn =====
              SectionTitle(
                title: "Khóa học ngắn gọn dành cho bạn",
                textTheme: textTheme,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shortAndSweetCourses.length,
                  itemBuilder: (context, index) {
                    final course = shortAndSweetCourses[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0
                            ? AppDimens.spacing16
                            : AppDimens.spacing8,
                        right: index == shortAndSweetCourses.length - 1
                            ? AppDimens.spacing16
                            : AppDimens.spacing8,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('${Routes.course}/$index');
                        },
                        child: CourseCard(
                          course: course,
                          textTheme: textTheme,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // ===== PHẦN 2: Người học đang xem =====
              SectionTitle(
                title: "Người học đang xem",
                textTheme: textTheme,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: learnersAreViewing.length,
                  itemBuilder: (context, index) {
                    final course = learnersAreViewing[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0
                            ? AppDimens.spacing16
                            : AppDimens.spacing8,
                        right: index == learnersAreViewing.length - 1
                            ? AppDimens.spacing16
                            : AppDimens.spacing8,
                      ),
                      child: CourseCard(
                        course: course,
                        textTheme: textTheme,
                      ),
                    );
                  },
                ),
              ),

              // ===== PHẦN 3: Danh mục =====
              SectionTitle(
                title: "Danh mục",
                textTheme: textTheme,
                onTap: () {
                  // xử lý khi nhấn "Xem tất cả"
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.spacing6),
                child: Wrap(
                  spacing: AppDimens.spacing8,
                  runSpacing: AppDimens.spacing4,
                  children: categories
                      .map((cat) => CategoryChip(
                            label: cat,
                            textTheme: textTheme,
                            brightness: brightness,
                          ))
                      .toList(),
                ),
              ),

              SizedBox(height: AppDimens.spacing4),

              // ===== PHẦN 4: Logo công ty & CTA =====
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: double.infinity,
                padding: const EdgeInsets.all(AppDimens.spacing16),
                child: Column(
                  children: [
                    Text(
                      "Các công ty hàng đầu tin tưởng Abu Education",
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppDimens.spacing16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        PlaceholderLogo(),
                        PlaceholderLogo(),
                        PlaceholderLogo(),
                        PlaceholderLogo(),
                      ],
                    ),
                    SizedBox(height: AppDimens.spacing16),
                    Text(
                      "Dùng thử Abu Education cho Doanh nghiệp",
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppDimens.spacing4),
            ],
          ),
        ),
      ),
    );
  }
}

// ===================================================================
// WIDGET: PlaceholderLogo
// ===================================================================
class PlaceholderLogo extends StatelessWidget {
  const PlaceholderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.appBarHeightSmall,
      height: AppDimens.appBarHeightSmall,
      color: Colors.white24,
      child: Center(
        child: Text(
          "Logo",
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// ===================================================================
// MODEL: CourseModel
// ===================================================================
class CourseModel {
  final String imageUrl;
  final String title;
  final String author;
  final double rating;
  final int ratingCount;
  final String price;
  final String oldPrice;
  final bool isBestseller;

  const CourseModel({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.oldPrice,
    required this.isBestseller,
  });
}
