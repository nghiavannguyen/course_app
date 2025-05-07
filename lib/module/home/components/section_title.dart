import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final TextTheme textTheme;
  final VoidCallback? onTap;

  const SectionTitle({
    super.key,
    required this.title,
    required this.textTheme,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style:
                  textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              softWrap: true,
            ),
          ),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Xem tất cả',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
