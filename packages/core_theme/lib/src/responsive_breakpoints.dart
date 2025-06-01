enum ScreenSize {
  mobile,
  tablet,
  desktop,
}

class ResponsiveBreakpoints {
  static ScreenSize getScreenSize(double width) {
    if (width > 1024) return ScreenSize.desktop;
    if (width >= 600) return ScreenSize.tablet;
    return ScreenSize.mobile;
  }

  static bool isMobile(double width) {
    return getScreenSize(width) == ScreenSize.mobile;
  }

  static bool isTablet(double width) {
    return getScreenSize(width) == ScreenSize.tablet;
  }

  static bool isDesktop(double width) {
    return getScreenSize(width) == ScreenSize.desktop;
  }
}
