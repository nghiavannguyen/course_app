import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ===== DUMMY DATA CHO DEMO =====
  final List<CourseModel> shortAndSweetCourses = const [
    CourseModel(
      imageUrl: "https://dummyimage.com/300x180",
      title: "Scikit-learn in Python: 100+ Data Science Projects",
      author: "Pawel Krakowiak",
      rating: 4.7,
      ratingCount: 96,
      price: "₫249,000",
      oldPrice: "₫799,000",
      isBestseller: true,
    ),
    CourseModel(
      imageUrl: "https://dummyimage.com/300x180",
      title: "Video Segmentation with Python using Deep Learning",
      author: "Dr. Angela M & Al Co.",
      rating: 4.6,
      ratingCount: 66,
      price: "₫249,000",
      oldPrice: "₫499,000",
      isBestseller: false,
    ),
  ];

  final List<CourseModel> learnersAreViewing = const [
    CourseModel(
      imageUrl: "https://dummyimage.com/300x180",
      title: "100 Days of Code: The Complete Python Pro Bootcamp",
      author: "Dr. Angela Yu, Developer and ...",
      rating: 4.7,
      ratingCount: 325785,
      price: "₫249,000",
      oldPrice: "₫1,499,000",
      isBestseller: true,
    ),
    CourseModel(
      imageUrl: "https://dummyimage.com/300x180",
      title: "The Complete Full-Stack Web Development Bootcamp",
      author: "Dr. Angela Yu, Developer and ...",
      rating: 4.7,
      ratingCount: 425628,
      price: "₫249,000",
      oldPrice: "₫1,499,000",
      isBestseller: true,
    ),
  ];

  final List<String> categories = const [
    "Marketing",
    "Business",
    "IT & Software",
    "Development",
    "Finance & Accounting",
  ];

  @override
  Widget build(BuildContext context) {
    // Lấy textTheme và brightness từ Theme
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      // Không hard-code màu nền, dùng từ theme
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== SECTION 1: "Short and sweet courses for you" =====
              SectionTitle(
                title: "Short and sweet courses for you",
                textTheme: textTheme,
              ),
              SizedBox(
                height: 300, // Chiều cao cho list ngang
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shortAndSweetCourses.length,
                  itemBuilder: (context, index) {
                    final course = shortAndSweetCourses[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 16 : 8,
                        right:
                            index == shortAndSweetCourses.length - 1 ? 16 : 8,
                      ),
                      child: CourseCard(
                        course: course,
                        textTheme: textTheme,
                      ),
                    );
                  },
                ),
              ),

              // ===== SECTION 2: "Learners are viewing" =====
              SectionTitle(
                title: "Learners are viewing",
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
                        left: index == 0 ? 16 : 8,
                        right: index == learnersAreViewing.length - 1 ? 16 : 8,
                      ),
                      child: CourseCard(
                        course: course,
                        textTheme: textTheme,
                      ),
                    );
                  },
                ),
              ),

              // ===== SECTION 3: DANH MỤC =====
              SectionTitle(
                title: "Categories",
                textTheme: textTheme,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: categories
                      .map((cat) => CategoryChip(
                            label: cat,
                            textTheme: textTheme,
                            brightness: brightness,
                          ))
                      .toList(),
                ),
              ),

              const SizedBox(height: 24),

              // ===== SECTION 4: LOGO CÔNG TY & CTA =====
              Container(
                // Đổi sang scaffoldBackgroundColor để đồng bộ theme
                color: Theme.of(context).scaffoldBackgroundColor,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Top companies trust Udemy",
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Giả lập các logo công ty
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        PlaceholderLogo(),
                        PlaceholderLogo(),
                        PlaceholderLogo(),
                        PlaceholderLogo(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // CTA
                    Text(
                      "Try Udemy Business",
                      style: textTheme.bodyLarge?.copyWith(
                        // Tùy chỉnh màu tím theo primaryColor hay khác
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// ===================================================================
// WIDGET: SectionTitle
// ===================================================================
class SectionTitle extends StatelessWidget {
  final String title;
  final TextTheme textTheme;

  const SectionTitle({
    super.key,
    required this.title,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ===================================================================
// WIDGET: CategoryChip
// ===================================================================
class CategoryChip extends StatelessWidget {
  final String label;
  final TextTheme textTheme;
  final Brightness brightness;

  const CategoryChip({
    super.key,
    required this.label,
    required this.textTheme,
    required this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    // Chọn màu nền cho chip dựa trên light/dark
    final bgColor =
        brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[300];

    return Chip(
      label: Text(label, style: textTheme.bodyMedium),
      backgroundColor: bgColor,
    );
  }
}

// ===================================================================
// WIDGET: CourseCard
// ===================================================================
class CourseCard extends StatelessWidget {
  final CourseModel course;
  final TextTheme textTheme;

  const CourseCard({
    super.key,
    required this.course,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Độ rộng cố định cho card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh khóa học
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              course.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),

          // Tên khóa học
          Text(
            course.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),

          // Tác giả
          Text(
            course.author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),

          // Rating & ratingCount
          Row(
            children: [
              Text(
                course.rating.toStringAsFixed(1),
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.star, color: Colors.amber, size: 14),
              const SizedBox(width: 4),
              Text(
                "(${course.ratingCount})",
                style: textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Giá & Giá gạch
          Row(
            children: [
              Text(
                course.price,
                style: textTheme.bodyLarge?.copyWith(
                  // Chọn màu cho giá
                  color: Colors.yellow[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                course.oldPrice,
                style: textTheme.bodyMedium?.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Bestseller
          if (course.isBestseller)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "Bestseller",
                style: textTheme.bodySmall?.copyWith(
                  // Để nổi bật, đặt text đen trên nền xanh
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
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
    // Thay bằng Image.asset hoặc Image.network logo thực tế
    return Container(
      width: 50,
      height: 50,
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
