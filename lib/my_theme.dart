
import 'package:flutter/material.dart';

class MyTheme {
  // static const Color lightPrimary  = Color(0XFF5d9CEC);
  // static const Color lightScaffoldBackground = Color(0XFFDFECDB);
  // static const Color green = Color(0XFF61E757);
  // static const Color red = Color(0XFFEC4B4B);
  static const Color lightPrimary = Color(0xFF5D9CEC);
  static const Color lightScaffoldBackground = Color(0xFFDFECDB);
  static const Color green = Color(0xFF61E757);
  static const Color red = Color(0xFFEC4B4B);
  static const Color primaryColor = lightPrimary;

  static final ThemeData lightTheme =
      ThemeData(
        primaryColor: lightPrimary,
        scaffoldBackgroundColor: lightScaffoldBackground,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            size: 36,
            color: lightPrimary
          ),
          unselectedIconTheme: IconThemeData(
            size: 36,
          ),
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: lightPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: Colors.black
          ),
          bodyMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold  ),
            titleLarge: TextStyle(fontSize: 28,
            fontWeight: FontWeight.bold)
        )
      );

}