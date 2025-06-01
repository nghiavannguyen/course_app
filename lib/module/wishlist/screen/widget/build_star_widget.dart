import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return Row(children: [Icon(icon), const SizedBox(width: 4), Text(text)]);
  }
}
