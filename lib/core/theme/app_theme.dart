import 'package:flutter/material.dart';
import 'package:safe_rag/core/constants/app_colors.dart' show AppColors;
import 'package:safe_rag/core/constants/app_styles.dart' show AppStyles;

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.whiteColor,

    colorScheme: ColorScheme.light(
      primary: AppColors.blueColor,
      onPrimary: AppColors.whiteColor,
      surface: AppColors.whiteColor,
      onSurface: AppColors.primaryColor,
    ),

    textTheme: TextTheme(
      titleLarge: AppStyles.blackBold24,
      titleMedium: AppStyles.blackReg16,
      titleSmall: AppStyles.blueBold16,
      headlineLarge: AppStyles.lightGreyReg16,
      headlineMedium: AppStyles.lightGreyReg12,
      headlineSmall: AppStyles.blueReg12,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.labelColor,
      selectedItemColor: AppColors.blueColor,
      unselectedItemColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );

  static final ThemeData darkMode = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.primaryColor,

    colorScheme: ColorScheme.dark(
      primary: AppColors.blueColor,
      surface: AppColors.primaryColor,
      shadow: AppColors.secondryColor,
      onSurface: AppColors.whiteColor,
    ),

    appBarTheme: AppBarTheme(color: AppColors.primaryColor),

    textTheme: TextTheme(
      titleLarge: AppStyles.whiteBold24,
      titleMedium: AppStyles.whiteReg16,
      titleSmall: AppStyles.blueBold16,
      headlineLarge: AppStyles.lightGreyReg16,
      headlineMedium: AppStyles.lightGreyReg12,
      headlineSmall: AppStyles.blueReg12,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondryColor,
      selectedItemColor: AppColors.blueColor,
      unselectedItemColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );
}
