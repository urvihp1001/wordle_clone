import 'package:flutter/material.dart';
import 'package:wordle_urvi_version/core/theme/app_colors.dart';
import 'package:wordle_urvi_version/core/theme/app_fonts.dart';

class AppTheme{
  static ThemeData getTheme(){
    return ThemeData(
      colorScheme: const ColorScheme(brightness: Brightness.dark,
      primary: AppColors.primary, 
      onPrimary: AppColors.surface, 
      secondary: AppColors.secondary,
      onSecondary: AppColors.surface, 
      error: AppColors.red, 
      onError: AppColors.surface, 
      surface: AppColors.surface, 
      onSurface: AppColors.text,
      onSurfaceVariant: AppColors.onSurface
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium:  TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
         bodyLarge:  TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          
        ),
        headlineSmall: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
         headlineMedium: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
         headlineLarge: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
      )
    );
  }
}