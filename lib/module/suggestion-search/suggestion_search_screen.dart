import 'package:flutter/material.dart';

class SuggestionSearchScreen extends StatefulWidget {
  const SuggestionSearchScreen({super.key});

  @override
  State<SuggestionSearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SuggestionSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchHistory = ['Fff', 'abets', 'Abfth', 'Àh'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        automaticallyImplyLeading: false,
        title: TextField(
          controller: _searchController,
          style:
              textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
          decoration: InputDecoration(
            hintText: 'Tìm kiếm',
            hintStyle: textTheme.bodyLarge
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            prefixIcon:
                Icon(Icons.search, color: theme.colorScheme.onSurfaceVariant),
            filled: true,
            fillColor: theme.colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
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
          itemCount: _searchHistory.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.history,
                  color: theme.colorScheme.onSurfaceVariant),
              title: Text(_searchHistory[index],
                  style: textTheme.bodyLarge
                      ?.copyWith(color: theme.colorScheme.onSurface)),
              trailing: IconButton(
                icon: Icon(Icons.close,
                    color: theme.colorScheme.onSurfaceVariant),
                onPressed: () {
                  setState(() {
                    _searchHistory.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
