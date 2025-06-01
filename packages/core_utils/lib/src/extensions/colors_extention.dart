import 'package:flutter/material.dart';

/// Extension to easily access colors from theme
extension ColorSchemeHelper on BuildContext {
  /// Get color scheme from theme
  ColorScheme get _colorScheme => Theme.of(this).colorScheme;

  // MARK: - Primary Colors
  /// Primary color
  Color get primary => _colorScheme.primary;

  /// Primary container color
  Color get primaryContainer => _colorScheme.primaryContainer;

  /// On primary color
  Color get onPrimary => _colorScheme.onPrimary;

  /// On primary container color
  Color get onPrimaryContainer => _colorScheme.onPrimaryContainer;

  // MARK: - Secondary Colors
  /// Secondary color
  Color get secondary => _colorScheme.secondary;

  /// Secondary container color
  Color get secondaryContainer => _colorScheme.secondaryContainer;

  /// On secondary color
  Color get onSecondary => _colorScheme.onSecondary;

  /// On secondary container color
  Color get onSecondaryContainer => _colorScheme.onSecondaryContainer;

  // MARK: - Tertiary Colors
  /// Tertiary color
  Color get tertiary => _colorScheme.tertiary;

  /// Tertiary container color
  Color get tertiaryContainer => _colorScheme.tertiaryContainer;

  /// On tertiary color
  Color get onTertiary => _colorScheme.onTertiary;

  /// On tertiary container color
  Color get onTertiaryContainer => _colorScheme.onTertiaryContainer;

  // MARK: - Error Colors
  /// Error color
  Color get error => _colorScheme.error;

  /// Error container color
  Color get errorContainer => _colorScheme.errorContainer;

  /// On error color
  Color get onError => _colorScheme.onError;

  /// On error container color
  Color get onErrorContainer => _colorScheme.onErrorContainer;

  // MARK: - Background Colors
  /// Background color
  Color get background => _colorScheme.surface;

  /// On background color
  Color get onBackground => _colorScheme.onSurface;

  // MARK: - Surface Colors
  /// Surface color
  Color get surface => _colorScheme.surface;

  /// Surface variant color
  Color get surfaceVariant => _colorScheme.surfaceContainerHighest;

  /// Surface tint color
  Color get surfaceTint => _colorScheme.surfaceTint;

  /// On surface color
  Color get onSurface => _colorScheme.onSurface;

  /// On surface variant color
  Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;

  // MARK: - Outline Colors
  /// Outline color
  Color get outline => _colorScheme.outline;

  /// Outline variant color
  Color get outlineVariant => _colorScheme.outlineVariant;

  // MARK: - Inverse Colors
  /// Inverse surface color
  Color get inverseSurface => _colorScheme.inverseSurface;

  /// Inverse primary color
  Color get inversePrimary => _colorScheme.inversePrimary;

  /// On inverse surface color
  Color get onInverseSurface => _colorScheme.onInverseSurface;

  // MARK: - Other Colors
  /// Shadow color
  Color get shadow => _colorScheme.shadow;

  /// Scrim color
  Color get scrim => _colorScheme.scrim;
}
