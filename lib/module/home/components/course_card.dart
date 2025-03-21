import 'package:flutter/material.dart';

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
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),

          // Tác giả
          Text(
            course.author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall,
          ),
          const SizedBox(height: 4),

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
              const SizedBox(width: 4),
              const Icon(Icons.star, color: Colors.amber, size: 12),
              const SizedBox(width: 4),
              Text(
                "(${course.ratingCount})",
                style: textTheme.bodySmall,
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