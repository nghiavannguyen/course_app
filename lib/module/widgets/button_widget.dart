import 'package:flutter/material.dart';
import 'package:sub_project/common/widget/button/button_base.dart';

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
      child: ButtonBase.base(
          shape: shape,
          elevation: 0,
          isLoading: isLoading,
          // textStyle: textStyle ??
          //     Theme.of(context).textTheme.titleSmall?.copyWith(
          //           fontWeight: FontWeight.bold,
          //         ),
          child: Text(
            text ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          onPressed: onPressed,
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: borderRadius ?? 48),
    );
  }
}
