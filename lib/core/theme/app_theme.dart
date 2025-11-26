
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFFFF5A00); // figma orange

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.grey[100],
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),

    // ------- APPLY POPPINS EVERYWHERE -------
    textTheme: GoogleFonts.poppinsTextTheme(),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
