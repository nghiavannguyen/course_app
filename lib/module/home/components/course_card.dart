import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:core_theme/core_theme.dart';

import '../screen/home_screen.dart';

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
            child: AppImage(
              imageUrl: course.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: AppDimens.spacing2),

          // Tên khóa học
          Text(
            course.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppDimens.spacing1),

          // Tác giả
          Text(
            course.author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall,
          ),
          SizedBox(height: AppDimens.spacing1),

          // Rating & ratingCount
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.rating.toStringAsFixed(1),
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: AppDimens.spacing1),
              const Icon(Icons.star,
                  color: Colors.amber, size: AppDimens.icon20),
              SizedBox(width: AppDimens.spacing1),
              Text(
                "(${course.ratingCount})",
                style: textTheme.bodySmall,
              ),
            ],
          ),
          SizedBox(height: AppDimens.spacing1),

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
              SizedBox(width: AppDimens.spacing2),
              Text(
                course.oldPrice,
                style: textTheme.bodyMedium?.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimens.spacing1),

          // Bestseller
          if (course.isBestseller)
            AppButton(
              onPressed: () {},
              type: AppButtonType.secondary,
              isFullWidth: false,
              borderRadius: BorderRadius.circular(AppDimens.radius4),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.spacing2, vertical: AppDimens.spacing1),
              backgroundColor: Colors.greenAccent,
              child: Text(
                "Bestseller",
                style: textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
