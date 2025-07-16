import 'package:core_theme/core_theme.dart';
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
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing4, vertical: AppDimens.spacing2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: textTheme.headlineMedium,
            ),
          ),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(left: AppDimens.spacing2),
                child: Text('Xem tất cả',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ),
            ),
        ],
      ),
    );
  }
}
