import 'package:flutter/material.dart';

/// Enum defining text field styles
enum AppTextFieldStyle {
  /// Filled style with background color
  filled,

  /// Outlined style with border
  outlined,

  /// Plain style without background or border
  plain,
}

/// Enum defining text field sizes
enum AppTextFieldSize {
  /// Small size
  small,

  /// Medium size (default)
  medium,

  /// Large size
  large,
}

/// A customizable text field widget that follows Material Design guidelines
class AppTextField extends StatelessWidget {
  /// Creates an [AppTextField]
  const AppTextField({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.style = AppTextFieldStyle.filled,
    this.size = AppTextFieldSize.medium,
    this.isPassword = false,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.decoration,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.showCursor = true,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.toolbarOptions,
    this.showSelectionHandles = false,
    this.autofillHints,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.alignLabelWithHint,
  });

  /// Controller for the text field
  final TextEditingController controller;

  final bool? alignLabelWithHint;

  /// Hint text displayed when the field is empty
  final String? hint;

  /// Label text displayed above the field
  final String? label;

  /// Helper text displayed below the field
  final String? helperText;

  /// Error text displayed when the field has an error
  final String? errorText;

  /// Icon displayed before the text
  final Widget? prefixIcon;

  /// Icon displayed after the text
  final Widget? suffixIcon;

  /// Visual style of the text field
  final AppTextFieldStyle style;

  /// Size of the text field
  final AppTextFieldSize size;

  /// Whether this is a password field
  final bool isPassword;

  /// Whether the field is enabled
  final bool isEnabled;

  /// Whether the field is read-only
  final bool isReadOnly;

  /// Maximum number of lines
  final int? maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum length of the text
  final int? maxLength;

  /// Type of keyboard to show
  final TextInputType? keyboardType;

  /// Action button on the keyboard
  final TextInputAction? textInputAction;

  /// Called when the text changes
  final ValueChanged<String>? onChanged;

  /// Called when the user submits the text
  final ValueChanged<String>? onSubmitted;

  /// Called when the field is tapped
  final GestureTapCallback? onTap;

  /// Called when editing is complete
  final VoidCallback? onEditingComplete;

  /// Focus node for the field
  final FocusNode? focusNode;

  /// Whether to focus the field automatically
  final bool autofocus;

  /// Style for the text
  final TextStyle? textStyle;

  /// Custom decoration for the field
  final InputDecoration? decoration;

  /// Color of the cursor
  final Color? cursorColor;

  /// Width of the cursor
  final double cursorWidth;

  /// Radius of the cursor
  final Radius? cursorRadius;

  /// Whether to show the cursor
  final bool showCursor;

  /// Character used to obscure text
  final String obscuringCharacter;

  /// Whether to obscure the text
  final bool obscureText;

  /// Whether to enable autocorrect
  final bool autocorrect;

  /// Type of smart dashes
  final SmartDashesType? smartDashesType;

  /// Type of smart quotes
  final SmartQuotesType? smartQuotesType;

  /// Whether to enable suggestions
  final bool enableSuggestions;

  /// Type of text capitalization
  final TextCapitalization textCapitalization;

  /// Alignment of the text
  final TextAlign textAlign;

  /// Vertical alignment of the text
  final TextAlignVertical? textAlignVertical;

  /// Direction of the text
  final TextDirection? textDirection;

  /// Whether the field is read-only
  final bool readOnly;

  /// Options for the toolbar
  final ToolbarOptions? toolbarOptions;

  /// Whether to show selection handles
  final bool showSelectionHandles;

  /// Hints for autofill
  final Iterable<String>? autofillHints;

  /// How to clip the field
  final Clip clipBehavior;

  /// ID for state restoration
  final String? restorationId;

  /// Whether to enable scribble
  final bool scribbleEnabled;

  /// Whether to enable IME personalized learning
  final bool enableIMEPersonalizedLearning;

  /// Gets the padding based on the size
  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case AppTextFieldSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case AppTextFieldSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case AppTextFieldSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
    }
  }

  /// Gets the border radius based on the size
  BorderRadius _getBorderRadius() {
    switch (size) {
      case AppTextFieldSize.small:
        return BorderRadius.circular(8);
      case AppTextFieldSize.medium:
        return BorderRadius.circular(12);
      case AppTextFieldSize.large:
        return BorderRadius.circular(16);
    }
  }

  /// Gets the decoration based on the style and state
  InputDecoration _getDecoration(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Color getBackgroundColor() {
      switch (style) {
        case AppTextFieldStyle.filled:
          return colorScheme.surfaceContainerHighest;
        case AppTextFieldStyle.outlined:
        case AppTextFieldStyle.plain:
          return Colors.transparent;
      }
    }

    Color getBorderColor() {
      switch (style) {
        case AppTextFieldStyle.outlined:
          return colorScheme.outline;
        case AppTextFieldStyle.filled:
        case AppTextFieldStyle.plain:
          return Colors.transparent;
      }
    }

    final baseDecoration = InputDecoration(
      hintText: hint,
      labelText: label,
      alignLabelWithHint: alignLabelWithHint,
      helperText: helperText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: style == AppTextFieldStyle.filled,
      fillColor: getBackgroundColor(),
      border: OutlineInputBorder(
        borderRadius: _getBorderRadius(),
        borderSide: BorderSide(color: getBorderColor()),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _getBorderRadius(),
        borderSide: BorderSide(color: getBorderColor()),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _getBorderRadius(),
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: _getBorderRadius(),
        borderSide: BorderSide(color: colorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: _getBorderRadius(),
        borderSide: BorderSide(
          color: colorScheme.error,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: _getBorderRadius(),
        borderSide: BorderSide(
          color: getBorderColor().withOpacity(0.5),
        ),
      ),
      contentPadding: _getPadding(),
      labelStyle: textTheme.labelLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      hintStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      errorStyle: textTheme.bodySmall?.copyWith(
        color: colorScheme.error,
      ),
      helperStyle: textTheme.bodySmall?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      suffixIconConstraints: const BoxConstraints(
        minWidth: 40,
        minHeight: 40,
      ),
    );

    return decoration?.copyWith(
          hintText: baseDecoration.hintText,
          labelText: baseDecoration.labelText,
          helperText: baseDecoration.helperText,
          errorText: baseDecoration.errorText,
          prefixIcon: baseDecoration.prefixIcon,
          suffixIcon: baseDecoration.suffixIcon,
          filled: baseDecoration.filled,
          fillColor: baseDecoration.fillColor,
          border: baseDecoration.border,
          enabledBorder: baseDecoration.enabledBorder,
          focusedBorder: baseDecoration.focusedBorder,
          errorBorder: baseDecoration.errorBorder,
          focusedErrorBorder: baseDecoration.focusedErrorBorder,
          disabledBorder: baseDecoration.disabledBorder,
          contentPadding: baseDecoration.contentPadding,
          labelStyle: baseDecoration.labelStyle,
          hintStyle: baseDecoration.hintStyle,
          errorStyle: baseDecoration.errorStyle,
          helperStyle: baseDecoration.helperStyle,
        ) ??
        baseDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: _getDecoration(context),
      obscureText: isPassword || obscureText,
      enabled: isEnabled,
      readOnly: isReadOnly || readOnly,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      autofocus: autofocus,
      style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
      cursorColor: cursorColor ?? Theme.of(context).colorScheme.primary,
      cursorWidth: cursorWidth,
      cursorRadius: cursorRadius,
      showCursor: showCursor,
      obscuringCharacter: obscuringCharacter,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      toolbarOptions: toolbarOptions,
      autofillHints: autofillHints,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      scribbleEnabled: scribbleEnabled,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
    );
  }
}
