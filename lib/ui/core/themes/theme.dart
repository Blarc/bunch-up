import 'package:bunchup/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static final _textTheme = TextTheme(
    headlineLarge: GoogleFonts.plusJakartaSans(
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: GoogleFonts.plusJakartaSans(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: GoogleFonts.plusJakartaSans(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.plusJakartaSans(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.plusJakartaSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
    labelSmall: GoogleFonts.plusJakartaSans(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.grey3,
    ),
    labelLarge: GoogleFonts.plusJakartaSans(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
  );

  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      // grey3 works for both light and dark themes
      color: AppColors.grey3,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    // Ignored because extensions is currently empty
    // ignore: prefer_const_literals_to_create_immutables
    extensions: [
      // TagChipTheme(
      //   chipColor: AppColors.whiteTransparent,
      //   onChipColor: Colors.white,
      // ),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    // Ignored because extensions is currently empty
    // ignore: prefer_const_literals_to_create_immutables
    extensions: [
      // TagChipTheme(
      //   chipColor: AppColors.blackTransparent,
      //   onChipColor: Colors.white,
      // ),
    ],
  );
}
