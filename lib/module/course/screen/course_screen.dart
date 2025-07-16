import 'package:core_theme/core_theme.dart';
import 'package:core_ui/core_ui.dart';
import 'package:course_app/module/course/widget/youtube_video_player.dart';
import 'package:course_app/module/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../fakedata/fake_data.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  // ==== DUMMY DATA (bạn có thể thay thế) ====
  final String coursePreviewUrl = "https://dummyimage.com/600x300";
  final String courseTitle =
      "React - The Complete Guide 2025 (incl. Next.js, Redux)";
  final double courseRating = 4.6;
  final int courseRatingCount = 225000;
  final int courseStudentsCount = 940000;
  final bool isBestseller = true;
  final String coursePrice = "₫249.000";
  final String courseOldPrice = "₫1,499.000";
  final String discountText = "83% off - 5 hours left at this price!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar mô phỏng: nút đóng (X) bên trái, nút chia sẻ bên phải
      appBar: AppBar(
        scrolledUnderElevation: 0.0, // 100% = 100dp, 0% = 0dp
        title: Text(courseTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share),
            onPressed: () {
              // TODO: share logic
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== SECTION 1: PREVIEW & TITLE =====
            _buildPreviewSection(context),
            // ===== SECTION 2: PRICE & BUY =====
            _buildPriceSection(context),
            const SizedBox(height: AppDimens.spacing4),
            // ===== SECTION 3: WHAT YOU'LL LEARN =====
            _buildWhatYouWillLearnSection(context),
            const SizedBox(height: AppDimens.spacing4),
            // ===== SECTION 4: CURRICULUM =====
            _buildCurriculumSection(context),
            const SizedBox(height: AppDimens.spacing4),
            // ===== SECTION 5: COURSE INCLUDES =====
            _buildCourseIncludesSection(context),
            const SizedBox(height: 16),
            // ===== SECTION 6: REQUIREMENTS =====
            _buildRequirementsSection(context),
            const SizedBox(height: AppDimens.spacing4),

            // ===== SECTION 7: INSTRUCTORS =====
            _buildInstructorsSection(context),
            const SizedBox(height: AppDimens.spacing4),

            // ===== SECTION 8: STUDENT FEEDBACK =====
            _buildStudentFeedbackSection(context),
            // ===== SECTION 9: BUY AGAIN AT BOTTOM =====
            _buildBottomBuySection(context),
            const SizedBox(height: AppDimens.spacing4),
          ],
        ),
      ),
    );
  }

  // =======================
  // 1) PREVIEW & TITLE
  // =======================
  Widget _buildPreviewSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ảnh/Video Preview
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            children: [
              YoutubeVideoPlayer(
                youtubeUrl: "https://www.youtube.com/watch?v=kqtD5dpn9C8",
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.spacing3,
                    vertical: AppDimens.spacing1,
                  ),
                  color: Theme.of(context).canvasColor,
                  child: Text(
                    "Preview this course",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.spacing2),
        // Tên khóa học
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.buttonPaddingLarge),
          child: Text(
            courseTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: AppDimens.spacing1),
        // Rating, bestseller, students
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.buttonPaddingLarge),
          child: Row(
            children: [
              // Điểm rating
              Text(
                courseRating.toStringAsFixed(1),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(width: AppDimens.spacing1),
              const Icon(Icons.star,
                  color: Colors.amber, size: AppDimens.icon16),
              const SizedBox(width: AppDimens.spacing1),
              Text(
                "(${_formatNumber(courseRatingCount)} ratings) "
                "${_formatNumber(courseStudentsCount)} students",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.spacing1),
        if (isBestseller)
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.buttonPaddingLarge),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.spacing2, vertical: AppDimens.spacing1),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(AppDimens.radius4),
              ),
              child: Text(
                "Bestseller",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        const SizedBox(height: AppDimens.spacing2),
      ],
    );
  }

  // =======================
  // 2) PRICE & BUY
  // =======================
  Widget _buildPriceSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Giá
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                coursePrice,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(width: AppDimens.spacing2),
              Text(
                courseOldPrice,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
            ],
          ),
          // Giảm giá
          const SizedBox(height: AppDimens.spacing1),
          Text(
            discountText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppDimens.spacing2),
          // Nút "Buy now"
          AppButton(
            borderRadius: BorderRadius.circular(AppDimens.radius8),

            backgroundColor: Theme.of(context).colorScheme.primary,

            onPressed: () {},

            // state:
            //     controller.isLoading.value ? AppButtonState.loading : AppButtonState.normal,

            type: AppButtonType.primary,

            isFullWidth: true,

            child: const Text('Buy now'),
          ),
          const SizedBox(height: AppDimens.spacing2),
          // Nút "Add to wishlist"
          AppButton(
            borderRadius: BorderRadius.circular(AppDimens.radius8),

            onPressed: () {},

            // state:
            //     controller.isLoading.value ? AppButtonState.loading : AppButtonState.normal,

            type: AppButtonType.outline,

            isFullWidth: true,

            child: const Text('Add to wishlist'),
          )
        ],
      ),
    );
  }

  // =======================
  // 3) WHAT YOU'LL LEARN
  // =======================
  Widget _buildWhatYouWillLearnSection(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimens.buttonPaddingLarge),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        padding: const EdgeInsets.all(AppDimens.spacing4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What you'll learn",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppDimens.spacing2),
            ...whatYouWillLearn.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimens.spacing2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• "),
                    Expanded(
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // TODO: show more
              },
              child: Text(
                "Show more",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // =======================
  // 4) CURRICULUM
  // =======================
  Widget _buildCurriculumSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing4),
      child: Container(
        // decoration: BoxDecoration(
        //     // color: Theme.of(context).canvasColor,
        //     // borderRadius: BorderRadius.circular(DiMens.cardRadius8),
        //     ),
        // padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Curriculum",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppDimens.spacing1),
            Text(
              "40 sections • 726 lectures • 71h 22m total length",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: AppDimens.spacing2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Section 1 - Getting Started",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                ),
                Text(
                  "-",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            const SizedBox(height: AppDimens.spacing2),
            ...List.generate(
              curriculum.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimens.spacing2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            curriculum[index],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "Video 21:07",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.play_circle_fill, size: AppDimens.icon16),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // TODO: show more sections
              },
              child: Text(
                "34 more sections",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =======================
  // 5) COURSE INCLUDES
  // =======================
  Widget _buildCourseIncludesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This course includes",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppDimens.spacing2),
          ...courseIncludes.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppDimens.spacing2),
              child: Row(
                children: [
                  // Mô phỏng icon
                  const Icon(Icons.check_circle_outline,
                      size: AppDimens.icon16),
                  const SizedBox(width: AppDimens.spacing2),
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =======================
  // 6) REQUIREMENTS
  // =======================
  Widget _buildRequirementsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Requirements",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppDimens.spacing2),
          ...requirements.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppDimens.spacing2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• "),
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimens.spacing2),
          Text(
            "This bestselling course by the author of \"React Key Concepts\" has turned more students into ...",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  // =======================
  // 7) INSTRUCTORS
  // =======================
  Widget _buildInstructorsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Instructors",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppDimens.spacing4),
          ...instructors.map((inst) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppDimens.spacing6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên + avatar
                  Row(
                    children: [
                      CircleAvatar(
                        radius: AppDimens.radius24,
                        backgroundImage:
                            NetworkImage(inst.avatarUrl), // dummy if needed
                      ),
                      const SizedBox(width: AppDimens.spacing3),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              inst.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              inst.title,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimens.spacing2),
                  // Rating, reviews, students, courses
                  Text(
                    "${inst.rating} Instructor rating | ${_formatNumber(inst.reviewsCount)} Reviews | "
                    "${_formatNumber(inst.studentsCount)} Students | ${inst.coursesCount} Courses",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.color
                              ?.withOpacity(0.7),
                        ),
                  ),
                  const SizedBox(height: AppDimens.spacing2),
                  // Mô tả
                  Text(
                    inst.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppDimens.spacing2),
                  // "Show more", "View profile"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // TODO: show more
                        },
                        child: Text(
                          "Show more",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      const SizedBox(width: AppDimens.spacing4),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: view profile
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).canvasColor,
                        ),
                        child: Text(
                          "View profile",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // =======================
  // 8) STUDENT FEEDBACK
  // =======================
  Widget _buildStudentFeedbackSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing4),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(AppDimens.radius12),
        ),
        padding: const EdgeInsets.all(AppDimens.spacing4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Student feedback",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppDimens.spacing2),
            // Tổng rating
            Row(
              children: [
                Text(
                  studentFeedbackRating.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: AppDimens.spacing1),
                Text(
                  "course rating",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: AppDimens.spacing2),
            // Biểu đồ rating
            ...ratingDistribution.entries.map((entry) {
              final star = entry.key;
              final percent = entry.value;
              return _buildRatingBar(context, star, percent);
            }),
            const SizedBox(height: AppDimens.spacing4),
            // Danh sách review
            ...studentReviews.map(
              (review) => _buildStudentReview(context, review),
            ),
          ],
        ),
      ),
    );
  }

  // Widget hiển thị 1 thanh rating
  Widget _buildRatingBar(BuildContext context, int star, int percent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.spacing2),
      child: Row(
        children: [
          Text("$star", style: Theme.of(context).textTheme.bodyMedium),
          const Icon(Icons.star, color: Colors.amber, size: AppDimens.icon16),
          const SizedBox(width: AppDimens.spacing1),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: AppDimens.spacing2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.circular(AppDimens.radius4),
                  ),
                ),
                Container(
                  height: AppDimens.spacing2,
                  width: MediaQuery.of(context).size.width *
                      (percent / 100) *
                      0.7, // 0.7 để tránh tràn
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(AppDimens.radius4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppDimens.spacing2),
          Text("$percent%", style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  // Widget hiển thị 1 review
  Widget _buildStudentReview(BuildContext context, StudentReview review) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.spacing3),
      // Tạo 1 widget chứa 1 review
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tên + thời gian
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review.userName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                review.timeAgo,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.color
                          ?.withOpacity(0.7),
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacing1),
          // Rating
          Row(
            children: [
              for (int i = 1; i <= 5; i++)
                Icon(
                  Icons.star,
                  size: AppDimens.icon12,
                  color: i <= review.rating ? Colors.amber : Colors.grey,
                ),
            ],
          ),
          const SizedBox(height: AppDimens.spacing1),
          // Comment
          Text(
            review.comment,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Divider(),
        ],
      ),
    );
  }

  // =======================
  // 9) BUY SECTION (BOTTOM)
  // =======================
  Widget _buildBottomBuySection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing4, vertical: AppDimens.spacing3),
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(AppDimens.spacing3),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Giá
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  coursePrice,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: AppDimens.spacing2),
                Text(
                  courseOldPrice,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
              ],
            ),
            const SizedBox(height: AppDimens.spacing2),
            // Nút "Buy now"
            AppButton(
              borderRadius: BorderRadius.circular(AppDimens.radius8),

              backgroundColor: Theme.of(context).colorScheme.primary,

              // Giữ nguyên hàm xử lý khi nhấn nút

              onPressed: () {},

              // state:
              //     controller.isLoading.value ? AppButtonState.loading : AppButtonState.normal,

              // Sử dụng kiểu primary cho hành động chính

              type: AppButtonType.primary,

              // Để button chiếm toàn bộ chiều rộng

              isFullWidth: true,

// Nội dung của button giờ đây chỉ cần là Text

              child: const Text('Buy now'),
            )
          ],
        ),
      ),
    );
  }

  // =======================
  // Helper format number
  // =======================
  String _formatNumber(int number) {
    if (number >= 1000000) {
      return "${(number / 1000000).toStringAsFixed(1)}M";
    } else if (number >= 1000) {
      return "${(number / 1000).toStringAsFixed(1)}k";
    }
    return number.toString();
  }
}
