import 'package:flutter/material.dart';
import 'package:job_website/core/theme/app_colors.dart';
import 'package:job_website/core/theme/app_typography.dart';

/// App-wide theme configuration
/// Implements pixel-perfect design system from Figma
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: const ColorScheme.light(
        primary: AppColors.teal500,
        secondary: AppColors.blue500,
        surface: AppColors.white,
      ),
      textTheme: AppTypography.textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}




