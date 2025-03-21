import 'package:course_app/module/home/components/category_chip.dart';
import 'package:course_app/module/home/components/course_card.dart';
import 'package:course_app/module/home/components/section_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ===== DUMMY DATA CHO DEMO =====
  final List<CourseModel> shortAndSweetCourses = const [
    CourseModel(
      imageUrl:
          'https://lh3.googleusercontent.com/-nMO5UrXH7Ag/YG6k5BMteZI/AAAAAAAAnAM/5FbE1FwrynIWcuWmyGtk0zPJ-dxiqS4zgCLcBGAsYHQ/w433-h244/image.png',
      title: "Scikit-learn in Python: 100+ Data Science Projects",
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
      title: "Video Segmentation with Python using Deep Learning",
      author: "Dr. Angela M & Al Co.",
      rating: 4.6,
      ratingCount: 66,
      price: "₫249,000",
      oldPrice: "₫499,000",
      isBestseller: false,
    ),
    CourseModel(
      imageUrl:
          "https://lh3.googleusercontent.com/-nMO5UrXH7Ag/YG6k5BMteZI/AAAAAAAAnAM/5FbE1FwrynIWcuWmyGtk0zPJ-dxiqS4zgCLcBGAsYHQ/w433-h244/image.png",
      title: "Video Segmentation with Python using Deep Learning",
      author: "Dr. Angela M & Al Co.",
      rating: 4.6,
      ratingCount: 66,
      price: "₫249,000",
      oldPrice: "₫499,000",
      isBestseller: false,
    ),
    CourseModel(
      imageUrl:
          "https://lh3.googleusercontent.com/-nMO5UrXH7Ag/YG6k5BMteZI/AAAAAAAAnAM/5FbE1FwrynIWcuWmyGtk0zPJ-dxiqS4zgCLcBGAsYHQ/w433-h244/image.png",
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
      imageUrl: 'https://i.ytimg.com/vi/pDmSX2rBrww/maxresdefault.jpg',
      title: "100 Days of Code: The Complete Python Pro Bootcamp",
      author: "Dr. Angela Yu, Developer and ...",
      rating: 4.7,
      ratingCount: 325785,
      price: "₫249,000",
      oldPrice: "₫1,499,000",
      isBestseller: true,
    ),
    CourseModel(
      imageUrl: 'https://i.ytimg.com/vi/pDmSX2rBrww/maxresdefault.jpg',
      title: "The Complete Full-Stack Web Development Bootcamp",
      author: "Dr. Angela Yu, Developer and ...",
      rating: 4.7,
      ratingCount: 425628,
      price: "₫249,000",
      oldPrice: "₫1,499,000",
      isBestseller: true,
    ),
    CourseModel(
      imageUrl: 'https://i.ytimg.com/vi/pDmSX2rBrww/maxresdefault.jpg',
      title: "The Complete Full-Stack Web Development Bootcamp",
      author: "Dr. Angela Yu, Developer and ...",
      rating: 4.7,
      ratingCount: 425628,
      price: "₫249,000",
      oldPrice: "₫1,499,000",
      isBestseller: true,
    ),
    CourseModel(
      imageUrl: 'https://i.ytimg.com/vi/pDmSX2rBrww/maxresdefault.jpg',
      title: "The Complete Full-Stack Web Development Bootcamp",
      author: "Dr. Angela Yu, Developer and ...",
      rating: 4.7,
      ratingCount: 425628,
      price: "₫249,000",
      oldPrice: "₫1,499,000",
      isBestseller: true,
    )
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
                // onTap: () {},
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
                onTap: () {
                  //see all on tap here
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
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
                      "Top companies trust Abu Education",
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
                      "Try Abu Education Business",
                      style: textTheme.bodySmall?.copyWith(
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
