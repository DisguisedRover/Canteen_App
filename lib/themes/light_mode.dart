import 'package:flutter/material.dart';

// Enhanced Theme Data with more sophisticated color palette
ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade700,
    // Adding new colors for depth
    background: Colors.white,
    onBackground: Colors.grey.shade900,
    surfaceVariant: Colors.grey.shade200,
  ),
  // Enhanced text theme
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      letterSpacing: 0.15,
    ),
  ),
  // Custom properties
  cardTheme: CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
);
