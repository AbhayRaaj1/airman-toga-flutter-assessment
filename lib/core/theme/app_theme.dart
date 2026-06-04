import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1565C0),
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor:
    const Color(0xFFF5F7FA),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),

    cardTheme: CardThemeData(
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(20),
      ),
    ),

    elevatedButtonTheme:
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize:
        const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(14),
        ),
      ),
    ),

    inputDecorationTheme:
    InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(14),
        borderSide:
        const BorderSide(
          color: Color(0xFF1565C0),
          width: 2,
        ),
      ),
    ),

    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(30),
      ),
      selectedColor:
      const Color(0xFF1565C0),
      backgroundColor:
      Colors.grey.shade200,
      labelStyle:
      const TextStyle(
        fontWeight:
        FontWeight.w600,
      ),
    ),

    progressIndicatorTheme:
    const ProgressIndicatorThemeData(
      color: Color(0xFF1565C0),
      linearTrackColor:
      Color(0xFFE3EAF5),
    ),

    snackBarTheme:
    SnackBarThemeData(
      behavior:
      SnackBarBehavior.floating,
      shape:
      RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(12),
      ),
    ),

    fontFamily: 'Roboto',
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.dark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF42A5F5),
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor:
    const Color(0xFF0F172A),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    cardTheme: CardThemeData(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(20),
      ),
    ),

    elevatedButtonTheme:
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize:
        const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(14),
        ),
      ),
    ),

    inputDecorationTheme:
    InputDecorationTheme(
      filled: true,
      fillColor:
      const Color(0xFF1E293B),
      border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(14),
        borderSide:
        const BorderSide(
          color: Color(0xFF42A5F5),
          width: 2,
        ),
      ),
    ),

    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(30),
      ),
      selectedColor:
      const Color(0xFF42A5F5),
      backgroundColor:
      Colors.grey.shade800,
      labelStyle:
      const TextStyle(
        fontWeight:
        FontWeight.w600,
      ),
    ),

    progressIndicatorTheme:
    const ProgressIndicatorThemeData(
      color: Color(0xFF42A5F5),
      linearTrackColor:
      Color(0xFF1E293B),
    ),

    snackBarTheme:
    SnackBarThemeData(
      behavior:
      SnackBarBehavior.floating,
      shape:
      RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(12),
      ),
    ),

    fontFamily: 'Roboto',
  );
}