import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 22, 22, 22),
    primary: const Color.fromARGB(255, 120, 120, 120),
    secondary: const Color.fromARGB(255, 30, 30, 30),
    tertiary: const Color.fromARGB(255, 45, 45, 45),
    inversePrimary: Colors.grey.shade300,
    // Enhanced dark mode colors
    background: const Color.fromARGB(255, 18, 18, 18),
    onBackground: Colors.grey.shade100,
    surfaceVariant: const Color.fromARGB(255, 28, 28, 28),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
      color: Colors.white,
    ),
  ),
);
