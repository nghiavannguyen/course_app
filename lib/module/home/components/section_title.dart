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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Text(
                'See all',
                style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            )
        ],
      ),
    );
  }
}
