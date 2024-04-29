import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: const Color(0xFFFE3C5B),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      displayMedium: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      displaySmall: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headlineMedium: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headlineSmall: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
    colorScheme: const ColorScheme(
      primary: Color(0xFFFE3C5B),
      secondary: Color(0xFFe84545),
      background: Color(0xFFFFFFFF),
      brightness: Brightness.light,
      error: Color(0x00000000),
      onError: Color(0x00000000),
      onPrimary: Color(0xFFFFFFFF),
      onBackground: Color(0xFF2b2e4a),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF2b2e4a),
      surface: Color(0xFFFFFFFF),
    ).copyWith(background: Color(0xFFF5F5F5)),
  );
}
