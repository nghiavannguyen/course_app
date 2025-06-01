// lib/module/course_detail/screen/wishlist_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/wish_list_detail_controller.dart';
import 'widget/build_star_widget.dart';

class WishListDetailScreen extends GetView<WishListDetailController> {
  const WishListDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Loading...'),
          ),
          body: const Center(child: CircularProgressIndicator()),
        );
      }

      final wishListDetailcontroller = controller.course.value;
      if (wishListDetailcontroller == null || controller.error.value != null) {
        return Scaffold(
          appBar: AppBar(title: Text('Not Found')),
          body: const Center(child: Text('Khóa học không tồn tại')),
        );
      }
      return Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  wishListDetailcontroller.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              leading: BackButton(
                color: theme.iconTheme.color,
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.share, color: theme.iconTheme.color),
                  onPressed: () {},
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(wishListDetailcontroller.title,
                        style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 4),
                    Text(wishListDetailcontroller.subtitle,
                        style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 8),
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: wishListDetailcontroller.tagColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(wishListDetailcontroller.tag,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.white)),
                      ),
                      const Spacer(),
                      Text(wishListDetailcontroller.price,
                          style: theme.textTheme.headlineSmall
                              ?.copyWith(color: theme.primaryColor)),
                    ]),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: theme.elevatedButtonTheme.style?.copyWith(),
                      child: const Text('Mua ngay'),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48)),
                      child: const Text('Thêm vào danh sách mong ước'),
                    ),
                    const SizedBox(height: 16),
                    Text('Những gì bạn sẽ học',
                        style: theme.textTheme.headlineSmall),
                    ...wishListDetailcontroller.whatYouLearn.map((s) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(children: [
                            Icon(Icons.check),
                            const SizedBox(width: 8),
                            Expanded(child: Text(s))
                          ]),
                        )),
                    const SizedBox(height: 16),
                    Text('Chương trình giảng dạy',
                        style: theme.textTheme.headlineSmall),
                    Text(
                        '${wishListDetailcontroller.curriculumSections.length} phần • ${wishListDetailcontroller.totalLectures} bài giảng • ${wishListDetailcontroller.totalHours} giờ'),
                    ...wishListDetailcontroller.curriculumSections
                        .map((sec) => ListTile(
                              title: Text(sec),
                              trailing: const Icon(Icons.add),
                            )),
                    const SizedBox(height: 16),
                    Text('Khóa học này bao gồm',
                        style: theme.textTheme.headlineSmall),
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        BuildStarWidget(
                            theme: theme,
                            icon: Icons.play_circle,
                            text:
                                '${wishListDetailcontroller.totalHours} giờ video'),
                        BuildStarWidget(
                            theme: theme,
                            icon: Icons.quiz,
                            text:
                                '${wishListDetailcontroller.totalQuizzes} trắc nghiệm'),
                        BuildStarWidget(
                            theme: theme,
                            icon: Icons.article,
                            text:
                                '${wishListDetailcontroller.totalArticles} bài viết'),
                        BuildStarWidget(
                            theme: theme,
                            icon: Icons.file_present,
                            text:
                                '${wishListDetailcontroller.totalResources} file hỗ trợ'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('Mô tả', style: theme.textTheme.headlineSmall),
                    Text(wishListDetailcontroller.description),
                    const SizedBox(height: 16),
                    Text('Học viên cũng xem',
                        style: theme.textTheme.headlineSmall),
                    ...wishListDetailcontroller.suggestions.map((s) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(s.title),
                          trailing: Text(s.price),
                          onTap: () {},
                        )),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
