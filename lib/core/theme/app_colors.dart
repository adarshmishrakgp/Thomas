import 'package:flutter/material.dart';

/// Color constants extracted from design system
/// Following industry standards for maintainability and scalability
class AppColors {
  AppColors._();

  // Base Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Teal/Green Shades
  static const Color teal50 = Color(0xFFE6FFFA);
  static const Color teal500 = Color(0xFF319795);
  static const Color teal300 = Color(0xFF81E6D9);

  // Blue Shades
  static const Color blue50 = Color(0xFFEBF4FF);
  static const Color blue500 = Color(0xFF3182CE);

  // Gray Shades
  static const Color gray50 = Color(0xFFF7FAFC);
  static const Color gray400 = Color(0xFFCBD5E0);
  static const Color gray500 = Color(0xFF718096);
  static const Color gray600 = Color(0xFF4A5568);
  static const Color gray700 = Color(0xFF2D3748);
  static const Color gray700Alt = Color(0xFF707070);

  // Transparent/Overlay Colors
  static const Color blackOpacity20 = Color(0x33000000); // #00000033
  static const Color blackOpacity16 = Color(0x29000000); // #00000029

  // Design System Color Mapping
  static const Map<String, Color> colorMap = {
    '#FFFFFF': white,
    '#E6FFFA': teal50,
    '#EBF4FF': blue50,
    '#F7FAFC': gray50,
    '#718096': gray500,
    '#4A5568': gray600,
    '#2D3748': gray700,
    '#CBD5E0': gray400,
    '#81E6D9': teal300,
    '#319795': teal500,
    '#00000033': blackOpacity20,
    '#707070': gray700Alt,
    '#3182CE': blue500,
    '#00000029': blackOpacity16,
  };
}




