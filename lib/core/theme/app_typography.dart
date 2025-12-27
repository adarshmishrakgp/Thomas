import 'package:flutter/material.dart';
import 'package:job_website/core/theme/app_colors.dart';

/// Typography system matching Figma design specifications
/// Uses Lato font family with exact sizes and weights
class AppTypography {
  AppTypography._();

  // Font Family
  static const String fontFamily = 'Lato';

  // Text Styles matching Figma Character Styles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 130,
    fontWeight: FontWeight.w400,
    color: AppColors.gray500,
    height: 1.2,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 42,
    fontWeight: FontWeight.w500,
    color: AppColors.gray700,
    height: 1.2,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 21,
    fontWeight: FontWeight.w500,
    color: AppColors.gray600,
    height: 1.3,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15.75,
    fontWeight: FontWeight.w400,
    color: AppColors.gray500,
    height: 1.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.teal500,
    height: 1.4,
  );

  static const TextStyle labelSmallInverse = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.teal50,
    height: 1.4,
  );

  static const TextStyle buttonSemibold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.teal50,
    height: 1.4,
  );

  static const TextStyle buttonSemiboldTeal = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.teal500,
    height: 1.4,
  );

  static TextTheme get textTheme {
    return const TextTheme(
      displayLarge: displayLarge,
      headlineMedium: headlineMedium,
      titleMedium: titleMedium,
      bodyMedium: bodyMedium,
      labelSmall: labelSmall,
    );
  }
}




