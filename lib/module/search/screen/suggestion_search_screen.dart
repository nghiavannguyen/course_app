// lib/module/search/screen/suggestion_search_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/suggestion_search_controller.dart';
import '../../../core/navigation/routes.dart';

class SuggestionSearchScreen extends GetView<SuggestionSearchController> {
  const SuggestionSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goToResult(String id, String name) {
      Get.toNamed(Routes.resultSearch, arguments: {'id': id, 'name': name});
    }

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: 'Tìm khóa học...'),
          textInputAction: TextInputAction.search,
          // onChanged: controller.fetchSuggestions,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.error.value != null) {
          return Center(child: Text(controller.error.value!));
        }
        if (controller.suggestions.isEmpty) {
          return Center(child: Text('Nhập tên khóa học để tìm'));
        }
        return ListView.separated(
          itemCount: controller.suggestions.length,
          separatorBuilder: (_, __) => Divider(height: 1),
          itemBuilder: (_, i) {
            final s = controller.suggestions[i];
            return ListTile(
              title: Text(s.name),
              onTap: () => goToResult(s.id, s.name),
            );
          },
        );
      }),
    );
  }
}
