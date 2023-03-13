import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class ThemeDateCustom{
  static ThemeData getTheme()=>ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsScheme.kPrimaryColor,
    ),
    primaryColor: ColorsScheme.kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: ColorsScheme.kPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}