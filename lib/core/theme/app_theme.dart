import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:safe_rag/core/constants/app_colors.dart' show AppColors;
import 'package:safe_rag/core/constants/app_styles.dart' show AppStyles;
import 'package:safe_rag/core/theme/pin_theme_extension.dart';

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
      bodyLarge: AppStyles.blackBold16,
      bodyMedium: AppStyles.lightGreyBold16,
      bodySmall: AppStyles.lightGreyReg8,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.labelColor,
      selectedItemColor: AppColors.blueColor,
      unselectedItemColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.labelColor,

      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      hintStyle: AppStyles.lightGreyReg12,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.blueColor, width: 1.5.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.redColor, width: 1.2.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.redColor, width: 1.5.w),
      ),

      errorStyle: AppStyles.redReg12,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.whiteColor),
      checkColor: WidgetStateProperty.all(AppColors.blueColor),
    ),
    extensions: [
      PinThemeExtension(
        defaultTheme: PinTheme(
          width: 40.w,
          height: 40.h,
          textStyle: AppStyles.blackReg16,
          decoration: BoxDecoration(
            color: AppColors.labelColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        focusedTheme: PinTheme(
          width: 40.w,
          height: 40.h,
          textStyle: AppStyles.blackReg16,
          decoration: BoxDecoration(
            color: AppColors.labelColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.blueColor, width: 1.5.w),
          ),
        ),
      ),
    ],
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
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

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ),

    textTheme: TextTheme(
      titleLarge: AppStyles.whiteBold24,
      titleMedium: AppStyles.whiteReg16,
      titleSmall: AppStyles.blueBold16,
      headlineLarge: AppStyles.lightGreyReg16,
      headlineMedium: AppStyles.lightGreyReg12,
      headlineSmall: AppStyles.blueReg12,
      bodyLarge: AppStyles.whiteBold16,
      bodyMedium: AppStyles.lightGreyBold16,
      bodySmall: AppStyles.lightGreyReg8,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondryColor,
      selectedItemColor: AppColors.blueColor,
      unselectedItemColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondryColor,

      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      hintStyle: AppStyles.lightGreyReg12,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.blueColor, width: 1.5.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.redColor, width: 1.2.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.redColor, width: 1.5.w),
      ),

      errorStyle: AppStyles.redReg12,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primaryColor),
      checkColor: WidgetStateProperty.all(AppColors.whiteColor),
    ),
    extensions: [
      PinThemeExtension(
        defaultTheme: PinTheme(
          width: 40.w,
          height: 40.h,
          textStyle: AppStyles.whiteReg16,
          decoration: BoxDecoration(
            color: AppColors.secondryColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        focusedTheme: PinTheme(
          width: 40.w,
          height: 40.h,
          textStyle: AppStyles.whiteReg16,
          decoration: BoxDecoration(
            color: AppColors.secondryColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.blueColor, width: 1.5.w),
          ),
        ),
      ),
    ],
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    ),
  );
}
