import 'package:flutter/material.dart';

/// Hàm hiển thị dialog adaptive cho Android/iOS
Future<T?> showAdaptiveDialogCustom<T>({
  required BuildContext context,
  required String title,
  required Widget content,
  required List<Widget> actions,
  bool barrierDismissible = true,
}) {
  return showAdaptiveDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => AlertDialog.adaptive(
      title: Text(title),
      content: content,
      actions: actions,
    ),
  );
}

// Helper function to create action buttons
Widget createDialogAction({
  required String label,
  required VoidCallback onPressed,
  bool isDefault = false,
  bool isDestructive = false,
}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      foregroundColor: isDestructive ? Colors.red : null,
      textStyle: TextStyle(
        fontWeight: isDefault ? FontWeight.bold : FontWeight.normal,
      ),
    ),
    child: Text(label),
  );
}
