// lib/module/course_detail/screen/wishlist_detail_screen.dart
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_theme/core_theme.dart';

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
              scrolledUnderElevation: 0,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: AppImage(
                  imageUrl: wishListDetailcontroller.thumbnail,
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
                    const SizedBox(height: AppDimens.spacing1),
                    Text(wishListDetailcontroller.subtitle,
                        style: theme.textTheme.bodyMedium),
                    const SizedBox(height: AppDimens.spacing4),
                    Row(children: [
                      AppButton(
                        onPressed: null,
                        type: AppButtonType.secondary,
                        isFullWidth: false,
                        borderRadius: BorderRadius.circular(AppDimens.radius4),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimens.spacing2,
                            vertical: AppDimens.spacing1),
                        backgroundColor: wishListDetailcontroller.tagColor,
                        child: Text(wishListDetailcontroller.tag,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.white)),
                      ),
                      const Spacer(),
                      Text(wishListDetailcontroller.price,
                          style: theme.textTheme.headlineSmall?.copyWith(
                              color: theme.textTheme.bodyMedium?.color)),
                    ]),
                    const SizedBox(height: AppDimens.spacing4),
                    AppButton(
                      onPressed: () {},
                      type: AppButtonType.primary,
                      isFullWidth: true,
                      padding:
                          EdgeInsets.symmetric(vertical: AppDimens.spacing3),
                      child: const Text('Mua ngay'),
                    ),
                    const SizedBox(height: AppDimens.spacing4),
                    AppButton(
                      onPressed: () {},
                      type: AppButtonType.outline,
                      isFullWidth: true,
                      padding:
                          EdgeInsets.symmetric(vertical: AppDimens.spacing3),
                      child: const Text('Thêm vào danh sách mong ước'),
                    ),
                    const SizedBox(height: AppDimens.spacing4),

                    // AppCupertinoPicker(
                    //   initialItem: 6,
                    //   backgroundColor: theme.colorScheme.surface,
                    //   items: wishListDetailcontroller.whatYouLearn,
                    //   onSelectedItemChanged: (value) {},
                    // ),
                    Text('Những gì bạn sẽ học',
                        style: theme.textTheme.headlineSmall),
                    ...wishListDetailcontroller.whatYouLearn.map((s) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: AppDimens.spacing1),
                          child: Row(children: [
                            Icon(Icons.check),
                            SizedBox(width: AppDimens.spacing2),
                            Expanded(child: Text(s))
                          ]),
                        )),
                    const SizedBox(height: AppDimens.spacing4),
                    Text('Chương trình giảng dạy',
                        style: theme.textTheme.headlineSmall),
                    Text(
                        '${wishListDetailcontroller.curriculumSections.length} phần • ${wishListDetailcontroller.totalLectures} bài giảng • ${wishListDetailcontroller.totalHours} giờ'),
                    ...wishListDetailcontroller.curriculumSections
                        .map((sec) => ListTile(
                              title: Text(sec),
                              trailing: const Icon(Icons.add),
                            )),
                    const SizedBox(height: AppDimens.spacing4),
                    Text('Khóa học này bao gồm',
                        style: theme.textTheme.headlineSmall),
                    Wrap(
                      spacing: AppDimens.spacing4,
                      runSpacing: AppDimens.spacing2,
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
                    const SizedBox(height: AppDimens.spacing4),
                    Text('Mô tả', style: theme.textTheme.headlineSmall),
                    Text(wishListDetailcontroller.description),
                    const SizedBox(height: AppDimens.spacing4),
                    Text('Học viên cũng xem',
                        style: theme.textTheme.headlineSmall),
                    ...wishListDetailcontroller.suggestions.map((s) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(s.title),
                          trailing: Text(s.price),
                          onTap: () {},
                        )),
                    const SizedBox(height: AppDimens.spacing6),
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
