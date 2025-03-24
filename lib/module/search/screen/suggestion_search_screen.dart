import 'package:course_app/module/search/controller/suggestion_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestionSearchScreen extends StatefulWidget {
  const SuggestionSearchScreen({super.key});

  @override
  State<SuggestionSearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SuggestionSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final SuggestionSearchController resultSearchController =
      Get.find<SuggestionSearchController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 35,
          child: IgnorePointer(
            child: TextField(
              controller: _searchController,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
              decoration: InputDecoration(
                hintText: "Tìm kiếm",
                hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color),
                prefixIcon: Icon(
                  Icons.search,
                  size: 18,
                  color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 30,
                ),
                filled: true,
                fillColor: Theme.of(context).canvasColor.withOpacity(0.2),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  // borderSide: BorderSide(
                  //   color: Theme.of(context).dividerColor,
                  // ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 2,
                ),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Hủy',
                style: textTheme.bodyLarge
                    ?.copyWith(color: theme.colorScheme.primary)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: resultSearchController.searchHistory.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                resultSearchController
                    .onSearch(resultSearchController.searchHistory[index]);
              },
              child: ListTile(
                leading: Icon(Icons.history,
                    color: theme.colorScheme.onSurfaceVariant),
                title: Text(resultSearchController.searchHistory[index],
                    style: textTheme.bodyLarge
                        ?.copyWith(color: theme.colorScheme.onSurface)),
                trailing: IconButton(
                  icon: Icon(Icons.close,
                      color: theme.colorScheme.onSurfaceVariant),
                  onPressed: () {
                    setState(() {
                      resultSearchController.removeHistoryItem(
                          resultSearchController.searchHistory[index]);
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
