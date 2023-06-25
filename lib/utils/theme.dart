import 'package:crypto_app/utils/style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Priego",
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Color(0xFF24282E),
      onSecondary: Color(0xFFA5A5A5),
      error: Colors.red,
      onError: Colors.white,
      background: Color(0xFF14181D),
      onBackground: Colors.white,
      surface: Color(0xFF373B3E),
      onSurface: Color(0xFFC5C5C5),
      primaryContainer: Color(0xFF3948CD),
      secondaryContainer: Color(0xFFBAC1FD),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        letterSpacing: 1.1,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    ),
  );
}
