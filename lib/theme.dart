import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom colors
const primaryColor = Color(0xFF9C27B0); // Purple
const backgroundColor = Color(0xFF121212);
const cardColor = Color(0xFF1E1E1E);
const textColor = Color(0xFFF5F5F5);

// Light theme
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    secondary: primaryColor.withOpacity(0.8),
    surface: Colors.white,
    background: Colors.grey[100]!,
    error: Colors.red[700]!,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    displayMedium: GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    displaySmall: GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    bodySmall: const TextStyle(
      fontSize: 12,
      color: Colors.black87,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(
        color: primaryColor,
        width: 2,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    titleTextStyle: GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey[600],
  ),
);

// Dark theme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: primaryColor,
    secondary: primaryColor.withOpacity(0.8),
    surface: cardColor,
    background: backgroundColor,
    error: Colors.red[700]!,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: textColor,
    onBackground: textColor,
    onError: Colors.white,
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    ),
    displayMedium: GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    ),
    displaySmall: GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      color: textColor,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      color: textColor,
    ),
    bodySmall: const TextStyle(
      fontSize: 12,
      color: Colors.white70,
    ),
  ),
  cardTheme: CardTheme(
    color: cardColor,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(
        color: primaryColor,
        width: 2,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColor,
    foregroundColor: textColor,
    elevation: 0,
    titleTextStyle: GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: backgroundColor,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey[600],
  ),
  scaffoldBackgroundColor: backgroundColor,
);
