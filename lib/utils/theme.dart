import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
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
      textTheme: TextTheme());
}
