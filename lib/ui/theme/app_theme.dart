import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    textTheme: textTheme,
    primaryColor: AppColors.primaryColor,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: AppColors.deepBackGroundColor,
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.black,
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.whiteColor,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.greyColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
    ),
    useMaterial3: false,
  );

  static TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 36.sp,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      fontSize: 29.sp,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.sp,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: 20.sp,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
      // height: 1.25,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
      // height: 1.25,
    ),
    titleMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
    titleSmall: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
  );
}
