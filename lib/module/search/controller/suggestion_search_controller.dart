import 'package:course_app/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestionSearchController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();
  final RxList<String> searchHistory = <String>[].obs;
  final RxBool isSearching = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSearchHistory();
  }

  void _loadSearchHistory() {
    searchHistory.assignAll([
      "Fff",
      "abets",
      "Abfth",
      "Àh",
    ]);
  }

  void onSearch(String query) {
    if (query.isEmpty) return;

    if (!searchHistory.contains(query)) {
      searchHistory.insert(0, query);
    }

    Get.toNamed(Routes.resultSearch, arguments: query);
  }

  void removeHistoryItem(String item) {
    searchHistory.remove(item);
  }

  void clearSearch() {
    searchTextController.clear();
    isSearching.value = false;
  }
}
