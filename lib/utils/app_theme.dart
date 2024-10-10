

import 'package:flutter/material.dart';
import 'package:swd_project/utils/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        splashColor: Colors.transparent,
        dividerColor: AppColor.borderColor,
        appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0, backgroundColor: Colors.black),
        dividerTheme: DividerThemeData(
            thickness: 1, space: 0, color: AppColor.borderColor),
        checkboxTheme: CheckboxThemeData(
            checkColor: const WidgetStatePropertyAll(Colors.white),
            fillColor: WidgetStatePropertyAll(AppColor.gradientPrimaryColor)),
        highlightColor: Colors.transparent,
        fontFamily: "Aeonik",
        textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w200,
              color: AppColor.textColor),
          titleMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w200,
              color: AppColor.textColor),
          titleSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w200,
              color: AppColor.textColor),
          bodyLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColor.textColor),
          bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.textColor),
          bodySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.textColor),
          displayLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.textColor),
          displayMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.textColor),
          displaySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColor.textColor),
        ),
      );
}
