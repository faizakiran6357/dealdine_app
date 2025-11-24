import 'package:flutter/material.dart';


class AppTheme {
static final primaryColor = const Color(0xFFFF5A00); // figma orange


static final lightTheme = ThemeData(
primaryColor: primaryColor,
colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
scaffoldBackgroundColor: Colors.grey[100],
appBarTheme: const AppBarTheme(
backgroundColor: Colors.white,
foregroundColor: Colors.black,
elevation: 0,
),
textTheme: const TextTheme(
titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
);
}