import 'package:flutter/material.dart';

/// Enum defining button styles
enum AppButtonType {
  /// Primary button style
  primary,

  /// Secondary button style
  secondary,

  /// Tertiary button style
  tertiary,

  /// Text button style
  text,

  /// Outline button style
  outline,
}

/// Enum defining button states
enum AppButtonState {
  /// Normal state
  normal,

  /// Loading state
  loading,

  /// Disabled state
  disabled,

  /// Error state
  error,
}

/// A customizable button widget that follows Figma design
class AppButton extends StatelessWidget {
  /// Creates an [AppButton]
  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.type = AppButtonType.primary,
    this.state = AppButtonState.normal,
    this.isFullWidth = false,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.loadingColor,
    this.errorColor,
    this.disabledColor,
    this.disabledForegroundColor,
    this.style,
  });

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Child widget
  final Widget child;

  /// Button style type
  final AppButtonType type;

  /// Button state
  final AppButtonState state;

  /// Whether button should take full width
  final bool isFullWidth;

  /// Icon before the text
  final Widget? prefixIcon;

  /// Icon after the text
  final Widget? suffixIcon;

  /// Border radius
  final BorderRadius? borderRadius;

  /// Padding
  final EdgeInsetsGeometry? padding;

  /// Margin
  final EdgeInsetsGeometry? margin;

  /// Background color
  final Color? backgroundColor;

  /// Foreground color
  final Color? foregroundColor;

  /// Border color
  final Color? borderColor;

  /// Loading indicator color
  final Color? loadingColor;

  /// Error state color
  final Color? errorColor;

  /// Disabled state color
  final Color? disabledColor;

  /// Disabled state foreground color
  final Color? disabledForegroundColor;

  /// Custom button style
  final ButtonStyle? style;

  /// Tạo một bản sao của AppButton với các thuộc tính được cập nhật
  AppButton copyWith({
    VoidCallback? onPressed,
    Widget? child,
    AppButtonType? type,
    AppButtonState? state,
    bool? isFullWidth,
    Widget? prefixIcon,
    Widget? suffixIcon,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? loadingColor,
    Color? errorColor,
    Color? disabledColor,
    Color? disabledForegroundColor,
    ButtonStyle? style,
  }) {
    return AppButton(
      onPressed: onPressed ?? this.onPressed,
      type: type ?? this.type,
      state: state ?? this.state,
      isFullWidth: isFullWidth ?? this.isFullWidth,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderColor: borderColor ?? this.borderColor,
      loadingColor: loadingColor ?? this.loadingColor,
      errorColor: errorColor ?? this.errorColor,
      disabledColor: disabledColor ?? this.disabledColor,
      disabledForegroundColor: disabledForegroundColor ?? this.disabledForegroundColor,
      style: style ?? this.style,
      child: child ?? this.child,
    );
  }

  /// Gets the style based on type and state
  ButtonStyle _getStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Get base color based on type
    Color getBackgroundColor() {
      if (backgroundColor != null) return backgroundColor!;

      switch (type) {
        case AppButtonType.primary:
          return colorScheme.primary;
        case AppButtonType.secondary:
          return colorScheme.secondary;
        case AppButtonType.tertiary:
          return colorScheme.tertiary;
        case AppButtonType.text:
          return Colors.transparent;
        case AppButtonType.outline:
          return Colors.transparent;
      }
    }

    // Get foreground color based on type
    Color getForegroundColor() {
      if (foregroundColor != null) return foregroundColor!;

      switch (type) {
        case AppButtonType.primary:
          return colorScheme.onPrimary;
        case AppButtonType.secondary:
          return colorScheme.onSecondary;
        case AppButtonType.tertiary:
          return colorScheme.onTertiary;
        case AppButtonType.text:
          return colorScheme.primary;
        case AppButtonType.outline:
          return colorScheme.primary;
      }
    }

    // Get border color based on type
    Color getBorderColor() {
      if (borderColor != null) return borderColor!;

      switch (type) {
        case AppButtonType.outline:
          return colorScheme.primary;
        default:
          return Colors.transparent;
      }
    }

    // Get disabled color based on type
    Color getDisabledColor() {
      if (disabledColor != null) return disabledColor!;

      switch (type) {
        case AppButtonType.text:
          return Colors.transparent;
        case AppButtonType.outline:
          return Colors.transparent;
        default:
          return colorScheme.surfaceContainerHighest;
      }
    }

    // Get disabled foreground color
    Color getDisabledForegroundColor() {
      if (disabledForegroundColor != null) return disabledForegroundColor!;
      return colorScheme.onSurfaceVariant;
    }

    // Get error color
    Color getErrorColor() {
      if (errorColor != null) return errorColor!;
      return colorScheme.error;
    }

    // Get loading color
    Color getLoadingColor() {
      if (loadingColor != null) return loadingColor!;
      return getForegroundColor();
    }

    // Create base style
    final baseStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return getDisabledColor();
        }
        if (state == AppButtonState.error) {
          return getErrorColor();
        }
        return getBackgroundColor();
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return getDisabledForegroundColor();
        }
        return getForegroundColor();
      }),
      side: WidgetStateProperty.all(
        BorderSide(color: getBorderColor()),
      ),
      padding: WidgetStateProperty.all(padding),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
      ),
      minimumSize: WidgetStateProperty.all(
        isFullWidth ? const Size(double.infinity, 0) : Size.zero,
      ),
    );

    // Merge with custom style if provided
    return style?.copyWith(
          backgroundColor: baseStyle.backgroundColor,
          foregroundColor: baseStyle.foregroundColor,
          side: baseStyle.side,
          padding: baseStyle.padding,
          shape: baseStyle.shape,
          minimumSize: baseStyle.minimumSize,
        ) ??
        baseStyle;
  }

  /// Build loading widget
  Widget _buildLoading() {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          loadingColor ?? Colors.white,
        ),
      ),
    );
  }

  /// Build error widget
  Widget _buildError() {
    return Icon(
      Icons.error_outline,
      color: errorColor ?? Colors.white,
      size: 20,
    );
  }

  /// Build content widget
  Widget _buildContent() {
    if (state == AppButtonState.loading) {
      return _buildLoading();
    }

    if (state == AppButtonState.error) {
      return _buildError();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixIcon != null) ...[
          prefixIcon!,
          const SizedBox(width: 8),
        ],
        child,
        if (suffixIcon != null) ...[
          const SizedBox(width: 8),
          suffixIcon!,
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: state == AppButtonState.normal ? onPressed : null,
        style: _getStyle(context),
        child: _buildContent(),
      ),
    );
  }
}
