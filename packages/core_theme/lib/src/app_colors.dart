import 'package:flutter/material.dart';

/// A class that holds all the colors used in the application.
/// Following Material Design color system and best practices.
class AppColors {
  /// Convert hex string to Color
  static Color fromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  // MARK: - Brand Colors
  /// Primary brand color
  static const Color primary = Color(0xFFFF7D0D);
  static const Color primaryLight = Color(0xFFFF9D4D);
  static const Color primaryDark = Color(0xFFE56D00);

  /// Secondary brand color
  static const Color secondary = Color(0xFF3385D7);
  static const Color secondaryLight = Color(0xFF5BA1E3);
  static const Color secondaryDark = Color(0xFF2B6FB3);

  // MARK: - Semantic Colors
  /// Success state color
  static const Color success = Color(0xFF41C8B1);
  static const Color successLight = Color(0xFF6DD4C1);
  static const Color successDark = Color(0xFF35A896);

  /// Warning state color
  static const Color warning = Color(0xFFFFBE0A);
  static const Color warningLight = Color(0xFFFFD14D);
  static const Color warningDark = Color(0xFFE6AB00);

  /// Error state color
  static const Color error = Color(0xFFFF1B0A);
  static const Color errorLight = Color(0xFFFF4D3D);
  static const Color errorDark = Color(0xFFE61600);

  /// Info state color
  static const Color info = Color(0xFF3385D7);
  static const Color infoLight = Color(0xFF5BA1E3);
  static const Color infoDark = Color(0xFF2B6FB3);

  // MARK: - Neutral Colors
  /// Neutral colors for text, backgrounds, and borders
  static const Color neutral = Color(0xFF6D7474);
  static const Color neutralLight = Color(0xFF969C9C);
  static const Color neutralDark = Color(0xFF313535);

  // MARK: - Background Colors
  /// Background colors for different surfaces
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFF3F7F7);
  static const Color backgroundTertiary = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF121212);

  // MARK: - Text Colors
  /// Text colors for different emphasis levels
  static const Color textPrimary = Color(0xFF313535);
  static const Color textSecondary = Color(0xFF6D7474);
  static const Color textTertiary = Color(0xFF969C9C);
  static const Color textHint = Color(0xFFAAAAAA);
  static const Color textDisabled = Color(0xFFC0C4C4);

  // MARK: - Border Colors
  /// Border colors for different states
  static const Color border = Color(0xFFEEEEEE);
  static const Color borderLight = Color(0xFFF3F7F7);
  static const Color borderDark = Color(0xFFC0C4C4);

  // MARK: - Overlay Colors
  /// Overlay colors for different states
  static const Color overlay = Color(0x80000000); // 50% black
  static const Color overlayLight = Color(0x40000000); // 25% black
  static const Color overlayDark = Color(0xCC000000); // 80% black

  // MARK: - Shadow Colors
  /// Shadow colors for different elevations
  static const Color shadow = Color(0x1A000000); // 10% black
  static const Color shadowMedium = Color(0x33000000); // 20% black
  static const Color shadowDark = Color(0x4D000000); // 30% black

  // MARK: - State Colors
  /// Colors for different interactive states
  static const Color hover = Color(0x0A000000); // 4% black
  static const Color focus = Color(0x14000000); // 8% black
  static const Color selected = Color(0x1A000000); // 10% black
  static const Color disabled = Color(0x61000000); // 38% black

  // MARK: - Social Colors
  /// Colors for social media platforms
  static const Color facebook = Color(0xFF1877F2);
  static const Color google = Color(0xFFDB4437);
  static const Color apple = Color(0xFF000000);
  static const Color twitter = Color(0xFF1DA1F2);

  // MARK: - Extended Colors
  /// Additional colors for specific use cases
  static const Color divider = Color(0xFFD5D7D7);
  static const Color buttonShadow = Color(0xFFFFD1AA);
  static const Color icon = primary;
  static const Color iconGrey = Color(0xFF6D7474);
  static const Color iconWhite = Color(0xFFFFFFFF);
  static const Color iconNeutral = Color(0xFFAAAAAA);
}
