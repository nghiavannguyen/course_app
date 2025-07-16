// lib/module/wishlist/screen/wishlist_screen.dart
import 'package:course_app/module/wishlist/screen/widget/course_list_Item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_theme/core_theme.dart';

import '../controller/wish_list_controller.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WishListController>();
    final courses = controller.courses;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
          title: Text('Wish List'),
          centerTitle: true,
          scrolledUnderElevation: 0),
      body: Obx(() {
        if (controller.isLoading.value) {
          return AppLoading.base();
        }
        return ListView.separated(
          padding: EdgeInsets.all(AppDimens.spacing4),
          itemCount: courses.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: AppDimens.spacing6),
          itemBuilder: (context, index) {
            final course = courses[index];
            return CourseListItem(course: course);
          },
        );
      }),
    );
  }
}
