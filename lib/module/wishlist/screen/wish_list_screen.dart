// lib/module/wishlist/screen/wishlist_screen.dart
import 'package:course_app/module/wishlist/screen/widget/course_list_Item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: courses.length,
          separatorBuilder: (context, index) => const SizedBox(height: 24),
          itemBuilder: (context, index) {
            final course = courses[index];
            return CourseListItem(course: course);
          },
        );
      }),
    );
  }
}
