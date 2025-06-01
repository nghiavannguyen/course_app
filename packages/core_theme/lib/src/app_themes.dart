import 'package:core_theme/src/app_colors.dart';
import 'package:core_theme/src/app_text_styles.dart';
import 'package:flutter/material.dart';

/// A class that holds all the theme data for the application.
/// Following Material Design 3 standards and best practices.
class AppThemes {
  static const String fontFamily = 'poppins';

  // MARK: - Theme Data
  static ThemeData get lightTheme => _buildTheme(
        brightness: Brightness.light,
        colorScheme: _lightColorScheme,
        textTheme: AppTextStyles.lightTextTheme,
        fontFamily: fontFamily,
      );

  static ThemeData get darkTheme => _buildTheme(
        brightness: Brightness.dark,
        colorScheme: _darkColorScheme,
        textTheme: AppTextStyles.darkTextTheme,
        fontFamily: fontFamily,
      );
  // primary: Cho các actions chính, CTAs, brand elements
  // secondary: Cho các actions phụ, accents
  // tertiary: Cho các actions bổ sung
  // error: Cho các trạng thái lỗi, actions nguy hiểm
  // surface: Cho cards, sheets, dialogs
  // background: Cho main background
  // outline: Cho borders, dividers
  // inverse: Cho các elements cần contrast cao
  // MARK: - Color Schemes
  /// Light theme color scheme
  ///
  /// Usage guidelines:
  /// - primary: Main brand color, used for primary actions, key UI elements
  /// - onPrimary: Text and icons on primary color (usually white)
  /// - primaryContainer: Background for primary elements, less prominent than primary
  /// - onPrimaryContainer: Text and icons on primaryContainer
  ///
  /// - secondary: Secondary brand color, used for secondary actions
  /// - onSecondary: Text and icons on secondary color
  /// - secondaryContainer: Background for secondary elements
  /// - onSecondaryContainer: Text and icons on secondaryContainer
  ///
  /// - tertiary: Third brand color, used for tertiary actions
  /// - onTertiary: Text and icons on tertiary color
  /// - tertiaryContainer: Background for tertiary elements
  /// - onTertiaryContainer: Text and icons on tertiaryContainer
  ///
  /// - error: Color for error states and destructive actions
  /// - onError: Text and icons on error color
  /// - errorContainer: Background for error messages
  /// - onErrorContainer: Text and icons on errorContainer
  ///
  /// - background: Main background color of the app
  /// - onBackground: Text and icons on background
  /// - surface: Color for cards, sheets, and other surfaces
  /// - onSurface: Text and icons on surface
  /// - surfaceVariant: Alternative surface color for contrast
  /// - onSurfaceVariant: Text and icons on surfaceVariant
  ///
  /// - outline: Color for borders and dividers
  /// - outlineVariant: Alternative outline color for less emphasis
  /// - shadow: Color for shadows
  /// - scrim: Color for modal overlays
  ///
  /// - inverseSurface: Color for inverse surfaces (e.g., dark mode)
  /// - onInverseSurface: Text and icons on inverseSurface
  /// - inversePrimary: Primary color in inverse context
  /// - surfaceTint: Subtle tint for surfaces
  static final _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    primaryContainer: AppColors.primaryLight,
    onPrimaryContainer: AppColors.primaryDark,
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    secondaryContainer: AppColors.secondaryLight,
    onSecondaryContainer: AppColors.secondaryDark,
    tertiary: AppColors.info,
    onTertiary: Colors.white,
    tertiaryContainer: AppColors.infoLight,
    onTertiaryContainer: AppColors.infoDark,
    error: AppColors.error,
    onError: Colors.white,
    errorContainer: AppColors.errorLight,
    onErrorContainer: AppColors.errorDark,
    surface: AppColors.background,
    onSurface: AppColors.textPrimary,
    surfaceContainerHighest: AppColors.backgroundSecondary,
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.border,
    outlineVariant: AppColors.borderLight,
    shadow: AppColors.shadow,
    scrim: AppColors.overlay,
    inverseSurface: AppColors.backgroundDark,
    onInverseSurface: Colors.white,
    inversePrimary: AppColors.primaryLight,
    surfaceTint: AppColors.primary.withOpacity(0.05),
  );

  /// Dark theme color scheme
  ///
  /// Usage guidelines:
  /// - primary: Main brand color in dark mode
  /// - onPrimary: Text and icons on primary color in dark mode
  /// - primaryContainer: Darker version of primary for containers
  /// - onPrimaryContainer: Text and icons on primaryContainer in dark mode
  ///
  /// - secondary: Secondary brand color in dark mode
  /// - onSecondary: Text and icons on secondary color in dark mode
  /// - secondaryContainer: Darker version of secondary for containers
  /// - onSecondaryContainer: Text and icons on secondaryContainer in dark mode
  ///
  /// - tertiary: Third brand color in dark mode
  /// - onTertiary: Text and icons on tertiary color in dark mode
  /// - tertiaryContainer: Darker version of tertiary for containers
  /// - onTertiaryContainer: Text and icons on tertiaryContainer in dark mode
  ///
  /// - error: Error color in dark mode
  /// - onError: Text and icons on error color in dark mode
  /// - errorContainer: Darker version of error for containers
  /// - onErrorContainer: Text and icons on errorContainer in dark mode
  ///
  /// - background: Dark background color
  /// - onBackground: Text and icons on dark background
  /// - surface: Dark surface color for cards and sheets
  /// - onSurface: Text and icons on dark surface
  /// - surfaceVariant: Alternative dark surface color
  /// - onSurfaceVariant: Text and icons on dark surfaceVariant
  ///
  /// - outline: Border color in dark mode
  /// - outlineVariant: Alternative border color in dark mode
  /// - shadow: Shadow color in dark mode
  /// - scrim: Overlay color in dark mode
  ///
  /// - inverseSurface: Light surface color in dark mode
  /// - onInverseSurface: Text and icons on inverseSurface in dark mode
  /// - inversePrimary: Light primary color in dark mode
  /// - surfaceTint: Subtle tint for dark surfaces
  static final _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    primaryContainer: AppColors.primaryDark,
    onPrimaryContainer: AppColors.primaryLight,
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    secondaryContainer: AppColors.secondaryDark,
    onSecondaryContainer: AppColors.secondaryLight,
    tertiary: AppColors.info,
    onTertiary: Colors.white,
    tertiaryContainer: AppColors.infoDark,
    onTertiaryContainer: AppColors.infoLight,
    error: AppColors.error,
    onError: Colors.white,
    errorContainer: AppColors.errorDark,
    onErrorContainer: AppColors.errorLight,
    surface: AppColors.backgroundDark,
    onSurface: Colors.white,
    surfaceContainerHighest: AppColors.neutralDark,
    onSurfaceVariant: AppColors.neutralLight,
    outline: AppColors.borderDark,
    outlineVariant: AppColors.border,
    shadow: AppColors.shadowDark,
    scrim: AppColors.overlayDark,
    inverseSurface: Colors.white,
    onInverseSurface: AppColors.textPrimary,
    inversePrimary: AppColors.primaryDark,
    surfaceTint: AppColors.primary.withOpacity(0.05),
  );

  // MARK: - Theme Builder
  static ThemeData _buildTheme({
    required Brightness brightness,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required String fontFamily,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      fontFamily: fontFamily,
      package: 'core_theme',

      // MARK: - AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: colorScheme.onSurface,
        ),
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),

      // MARK: - Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: textTheme.labelSmall,
      ),

      // MARK: - Card Theme
      cardTheme: CardTheme(
        color: colorScheme.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // MARK: - Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        labelStyle: textTheme.labelMedium,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: colorScheme.outline),
        ),
        selectedColor: colorScheme.primary,
        secondarySelectedColor: colorScheme.secondary,
        disabledColor: colorScheme.onSurface.withOpacity(0.38),
      ),

      // MARK: - Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.surface,
        elevation: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),

      // MARK: - Divider Theme
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // MARK: - Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // MARK: - Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // MARK: - Icon Theme
      iconTheme: IconThemeData(
        color: colorScheme.onSurfaceVariant,
        size: 24,
      ),

      // MARK: - Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant.withOpacity(0.6),
        ),
        errorStyle: textTheme.bodySmall?.copyWith(
          color: colorScheme.error,
        ),
      ),

      // MARK: - Navigation Rail Theme
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: colorScheme.surface,
        selectedIconTheme: IconThemeData(
          color: colorScheme.primary,
          size: 24,
        ),
        unselectedIconTheme: IconThemeData(
          color: colorScheme.onSurfaceVariant,
          size: 24,
        ),
        selectedLabelTextStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelTextStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),

      // MARK: - Popup Menu Theme
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surface,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),

      // MARK: - Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onInverseSurface,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // MARK: - Tab Bar Theme
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicatorColor: colorScheme.primary,
        labelStyle: textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: textTheme.labelLarge,
      ),

      // MARK: - Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // MARK: - Time Picker Theme
      timePickerTheme: TimePickerThemeData(
        backgroundColor: colorScheme.surface,
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: colorScheme.primary),
        ),
        dayPeriodShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: colorScheme.primary),
        ),
        dayPeriodColor: colorScheme.surfaceContainerHighest,
        dayPeriodTextColor: colorScheme.onSurfaceVariant,
        dayPeriodBorderSide: BorderSide(color: colorScheme.outline),
      ),

      // MARK: - Tooltip Theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onInverseSurface,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
