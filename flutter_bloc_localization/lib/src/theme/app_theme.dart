import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.manrope(
      fontSize: 32.0,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.manrope(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.manrope(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.manrope(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      primarySwatch: Colors.indigo,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        foregroundColor: AppColors.darkPrimary,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
      ),
      textTheme: lightTextTheme,
    );
  }
}

class AppColors {
  static Color primary = Colors.deepPurpleAccent;
  static Color primaryDarker = Colors.deepPurpleAccent;
  static Color darkPrimary = const Color(0xFF1D2027);
  static Color blueGreyPrimary = const Color(0xFF819399);
  static Color blueGreySecondary = const Color(0xFFADC4CB);
  static Color lightGrey = const Color(0xFFF1F5F9);
}
