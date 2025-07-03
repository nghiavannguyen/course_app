import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.text,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.textStyle,
    this.isLoading = false,
    this.shape,
  });
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final bool isLoading;

  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 48),
          ),
        ),
        child: Text(
          text ?? '',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
