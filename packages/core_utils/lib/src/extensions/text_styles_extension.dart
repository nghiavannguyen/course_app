import 'package:flutter/material.dart';

/// Extension to easily access text styles from theme
extension TextStyleHelper on BuildContext {
  /// Get text styles from theme
  TextTheme get _textTheme => Theme.of(this).textTheme;

  /// Get color scheme from theme
  ColorScheme get _colorScheme => Theme.of(this).colorScheme;

  // MARK: - Display Styles
  /// Largest display text style
  TextStyle? get displayLarge => _textTheme.displayLarge;

  /// Medium display text style
  TextStyle? get displayMedium => _textTheme.displayMedium;

  /// Small display text style
  TextStyle? get displaySmall => _textTheme.displaySmall;

  // MARK: - Headline Styles
  /// Largest headline text style
  TextStyle? get headlineLarge => _textTheme.headlineLarge;

  /// Medium headline text style
  TextStyle? get headlineMedium => _textTheme.headlineMedium;

  /// Small headline text style
  TextStyle? get headlineSmall => _textTheme.headlineSmall;

  // MARK: - Title Styles
  /// Largest title text style
  TextStyle? get titleLarge => _textTheme.titleLarge;

  /// Medium title text style
  TextStyle? get titleMedium => _textTheme.titleMedium;

  /// Small title text style
  TextStyle? get titleSmall => _textTheme.titleSmall;

  // MARK: - Body Styles
  /// Largest body text style
  TextStyle? get bodyLarge => _textTheme.bodyLarge;

  /// Medium body text style
  TextStyle? get bodyMedium => _textTheme.bodyMedium;

  /// Small body text style
  TextStyle? get bodySmall => _textTheme.bodySmall;

  // MARK: - Label Styles
  /// Largest label text style
  TextStyle? get labelLarge => _textTheme.labelLarge;

  /// Medium label text style
  TextStyle? get labelMedium => _textTheme.labelMedium;

  /// Small label text style
  TextStyle? get labelSmall => _textTheme.labelSmall;
}

/// Extension to easily apply colors to text styles
extension TextStyleColorMapping on TextStyle {
  /// Apply primary color to text style
  TextStyle onPrimary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.primary);
  }

  /// Apply secondary color to text style
  TextStyle onSecondary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.secondary);
  }

  /// Apply tertiary color to text style
  TextStyle onTertiary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.tertiary);
  }

  /// Apply error color to text style
  TextStyle onError(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.error);
  }

  /// Apply background color to text style
  TextStyle onBackground(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.surface);
  }

  /// Apply surface color to text style
  TextStyle onSurface(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.surface);
  }

  /// Apply surface variant color to text style
  TextStyle onSurfaceVariant(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.surfaceContainerHighest);
  }

  /// Apply primary container color to text style
  TextStyle onPrimaryContainer(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.primaryContainer);
  }

  /// Apply secondary container color to text style
  TextStyle onSecondaryContainer(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.secondaryContainer);
  }

  /// Apply tertiary container color to text style
  TextStyle onTertiaryContainer(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.tertiaryContainer);
  }

  /// Apply error container color to text style
  TextStyle onErrorContainer(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.errorContainer);
  }

  /// Apply inverse surface color to text style
  TextStyle onInverseSurface(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.inverseSurface);
  }

  /// Apply inverse primary color to text style
  TextStyle onInversePrimary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.inversePrimary);
  }

  /// Apply outline color to text style
  TextStyle onOutline(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.outline);
  }

  /// Apply outline variant color to text style
  TextStyle onOutlineVariant(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.outlineVariant);
  }

  /// Apply shadow color to text style
  TextStyle onShadow(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.shadow);
  }

  /// Apply scrim color to text style
  TextStyle onScrim(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.scrim);
  }

  /// Apply surface tint color to text style
  TextStyle onSurfaceTint(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.surfaceTint);
  }
}

/// Extension to easily apply font weights to text styles
extension TextStyleWeightMapping on TextStyle {
  /// Apply light font weight
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Apply regular font weight
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Apply medium font weight
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Apply semi bold font weight
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Apply bold font weight
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Apply extra bold font weight
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
}

/// Extension to easily apply font styles to text styles
extension TextStyleStyleMapping on TextStyle {
  /// Apply italic font style
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// Apply normal font style
  TextStyle get normal => copyWith(fontStyle: FontStyle.normal);
}

/// Extension to easily apply text decorations to text styles
extension TextStyleDecorationMapping on TextStyle {
  /// Apply underline decoration
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  /// Apply line through decoration
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  /// Apply overline decoration
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  /// Remove all decorations
  TextStyle get noDecoration => copyWith(decoration: TextDecoration.none);
}

/// Extension to easily apply letter spacing to text styles
extension TextStyleLetterSpacingMapping on TextStyle {
  /// Apply tight letter spacing
  TextStyle get tight => copyWith(letterSpacing: -0.5);

  /// Apply normal letter spacing
  TextStyle get normal => copyWith(letterSpacing: 0.0);

  /// Apply wide letter spacing
  TextStyle get wide => copyWith(letterSpacing: 0.5);

  /// Apply wider letter spacing
  TextStyle get wider => copyWith(letterSpacing: 1.0);
}

/// Extension to easily apply line height to text styles
extension TextStyleHeightMapping on TextStyle {
  /// Apply tight line height
  TextStyle get tight => copyWith(height: 1.0);

  /// Apply normal line height
  TextStyle get normal => copyWith(height: 1.2);

  /// Apply relaxed line height
  TextStyle get relaxed => copyWith(height: 1.5);

  /// Apply loose line height
  TextStyle get loose => copyWith(height: 2.0);
}
