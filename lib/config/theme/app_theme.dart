import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/font_weight.dart';
import 'colors.dart';

abstract class AppTheme {
  static ThemeData getTheme(ColorScheme colorScheme) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: AppFontWeight.medium,
          color: AppColors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pink,
          foregroundColor: AppColors.white,
          minimumSize: Size(double.infinity, 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
          elevation: 0,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: AppFontWeight.medium,
            color: AppColors.white,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
          fontWeight: AppFontWeight.regular,
          fontSize: 12.sp,
          color: AppColors.white[80],
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: AppFontWeight.regular,
          fontSize: 12.sp,
          color: AppColors.pink,
        ),
      ),
      checkboxTheme: const CheckboxThemeData(shape: RoundedRectangleBorder(),
        fillColor: WidgetStatePropertyAll(Colors.transparent),
        checkColor: WidgetStatePropertyAll(AppColors.pink),
        side: BorderSide(color: Color(0xff49454F)),
      ),

      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: AppFontWeight.regular,
          color: AppColors.red,
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: AppFontWeight.regular,
          color: AppColors.white[70],
        ),
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: AppFontWeight.medium,
          color: AppColors.white[70],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.darkGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.darkGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.darkGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.red),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.pink,
      ),
      textTheme: TextTheme(
        displaySmall: TextStyle(
          fontSize: 13.sp,
          fontWeight: AppFontWeight.regular,
          color: AppColors.black,
        ),
        displayMedium: TextStyle(
          color: AppColors.pink,
          fontSize: 16.sp,
          fontWeight: AppFontWeight.regular,
        ),
        bodySmall: TextStyle(
          fontWeight: AppFontWeight.regular,
          fontSize: 12.sp,
          color: AppColors.black,
        ),
        labelSmall: TextStyle(
          fontWeight: AppFontWeight.regular,
          fontSize: 14.sp,
          color: AppColors.darkGrey,
        ),
        labelMedium: TextStyle(
          fontWeight: AppFontWeight.medium,
          fontSize: 18.sp,
          color: AppColors.black,
        ),
      ),
    );
  }

  static ThemeData lightTheme = getTheme(
    ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.pink,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      shadow: AppColors.black,
      onSurface: AppColors.darkGrey,
      onPrimaryFixed: AppColors.white[80],
    ),
  );
}
