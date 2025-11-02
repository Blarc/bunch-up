import 'package:flutter/material.dart';

abstract final class AppColors {
  static const blue1 = Color(0xFF017BFE);
  static const black1 = Color(0xFF101010);
  static const white1 = Color(0xFFFFF7FA);
  static const grey1 = Color(0xFFF2F2F2);
  static const grey2 = Color(0xFF4D4D4D);
  static const grey3 = Color(0xFFA4A4A4);
  static const whiteTransparent = Color(
    0x4DFFFFFF,
  ); // Figma rgba(255, 255, 255, 0.3)
  static const blackTransparent = Color(0x4D000000);
  static const red1 = Color(0xFFE74C3C);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.blue1,        // Blue buttons
    onPrimary: Colors.white,         // White text on blue buttons
    surface: Colors.white,           // White background
    onSurface: Colors.black,         // Black text on white background
    secondary: AppColors.grey2,      // Secondary elements
    onSecondary: Colors.white,       // Text on secondary elements
    error: AppColors.red1,           // Error color
    onError: Colors.white,           // Text on error elements
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.blue1,        // Keep blue buttons
    onPrimary: Colors.white,         // White text on blue buttons
    surface: AppColors.black1,       // Dark background
    onSurface: Colors.white,         // White text on dark background
    secondary: AppColors.grey3,      // Lighter grey for dark mode
    onSecondary: Colors.black,       // Text on secondary elements
    error: AppColors.red1,           // Error color
    onError: Colors.white,           // Text on error elements
  );
}