import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_theme/core_theme.dart';

import '../../../../core/navigation/routes.dart';
import '../../model/wish_list_model.dart';

class CourseListItem extends StatelessWidget {
  final CourseDetail course;
  const CourseListItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => Get.toNamed(Routes.wishListDetail, arguments: course.id),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.radius8),
            child: AppImage(
              imageUrl: course.thumbnail,
              width: 120,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: AppDimens.spacing3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: theme.textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppDimens.spacing1),
                Text(
                  course.instructor,
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: AppDimens.spacing1),
                Row(
                  children: [
                    Icon(Icons.star,
                        color: Colors.orange, size: AppDimens.icon16),
                    SizedBox(width: AppDimens.spacing1),
                    Text(
                      '${course.rating}',
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(width: AppDimens.spacing1),
                    Text(
                      '(${course.reviews})',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                SizedBox(height: AppDimens.spacing1),
                Text(
                  course.price,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
