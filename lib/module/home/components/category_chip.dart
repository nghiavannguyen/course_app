import 'package:flutter/material.dart';

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

    return Chip(
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      label: Text(label,
          style: textTheme.bodyMedium?.copyWith(
              color:
                  Brightness.dark == brightness ? Colors.white : Colors.black)),
      backgroundColor: bgColor,
    );
  }
}
