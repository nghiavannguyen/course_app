import 'package:core_theme/core_theme.dart';
import 'package:flutter/material.dart';

class BuildStarWidget extends StatelessWidget {
  const BuildStarWidget({
    super.key,
    required this.theme,
    required this.icon,
    required this.text,
  });

  final ThemeData theme;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon),
      SizedBox(width: AppDimens.spacing1),
      Text(text)
    ]);
  }
}
