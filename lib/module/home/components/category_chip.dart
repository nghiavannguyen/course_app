import 'package:core_theme/core_theme.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final TextTheme textTheme;
  final Brightness brightness;

  const CategoryChip({
    super.key,
    required this.label,
    required this.textTheme,
    required this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    // Chọn màu nền cho chip dựa trên light/dark
    final bgColor = brightness == Brightness.dark ? Colors.black : Colors.white;
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

    return AppButton(
      onPressed: () {}, // hoặc truyền callback nếu cần
      type: AppButtonType.outline,
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing3, vertical: AppDimens.spacing2),
      borderColor: Theme.of(context).dividerColor,
      isFullWidth: false,
      borderRadius: BorderRadius.circular(AppDimens.radius24),
      backgroundColor: bgColor,
      foregroundColor: textColor,
      child: Text(
        label,
        style: textTheme.bodyMedium?.copyWith(color: textColor),
      ),
    );
  }
}
