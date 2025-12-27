import 'package:flutter/material.dart';
import 'package:job_website/core/theme/app_colors.dart';

/// Shadow utilities matching Figma export specifications
/// Recreates shadows with exact offset, blur, and spread values
class ShadowUtils {
  ShadowUtils._();

  /// Creates a box shadow from Figma CSS values
  /// offset: (x, y), blur: radius, spread: spread radius
  static List<BoxShadow> createShadow({
    required Offset offset,
    required double blur,
    required double spread,
    Color? color,
  }) {
    return [
      BoxShadow(
        offset: offset,
        blurRadius: blur,
        spreadRadius: spread,
        color: color ?? AppColors.blackOpacity20,
      ),
    ];
  }

  /// Standard card shadow
  static List<BoxShadow> get cardShadow => createShadow(
        offset: const Offset(0, 2),
        blur: 8,
        spread: 0,
        color: AppColors.blackOpacity16,
      );

  /// Elevated shadow for buttons
  static List<BoxShadow> get buttonShadow => createShadow(
        offset: const Offset(0, 4),
        blur: 12,
        spread: 0,
        color: AppColors.blackOpacity20,
      );
}




