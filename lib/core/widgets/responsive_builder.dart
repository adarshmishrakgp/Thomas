import 'package:flutter/material.dart';

/// Responsive builder utility for maintaining exact ratios across devices
/// Uses MediaQuery and LayoutBuilder for pixel-perfect implementation
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, Size size, bool isMobile, bool isTablet, bool isDesktop) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;
        final isMobile = size.width < 600;
        final isTablet = size.width >= 600 && size.width < 1200;
        final isDesktop = size.width >= 1200;

        return builder(context, size, isMobile, isTablet, isDesktop);
      },
    );
  }

  /// Get responsive value based on screen size
  static T responsiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final size = MediaQuery.of(context).size;
    if (size.width >= 1200) {
      return desktop ?? tablet ?? mobile;
    } else if (size.width >= 600) {
      return tablet ?? mobile;
    }
    return mobile;
  }

  /// Get responsive padding
  static EdgeInsets responsivePadding({
    required BuildContext context,
    required EdgeInsets mobile,
    EdgeInsets? tablet,
    EdgeInsets? desktop,
  }) {
    return responsiveValue(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}




