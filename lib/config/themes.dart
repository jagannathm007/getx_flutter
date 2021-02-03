import 'package:flutter/material.dart';

class Themes {
  //your app's light and dark mode theme
  static final lightTheme = (context) => ThemeData.light().copyWith(
        primaryColor: Color(0xFF3B5998),
        buttonColor: Color(0xFF3B5998),
        accentColor: Color(0xFF8B9DC3),
        backgroundColor: Color(0xFFFFFFFF),
      );
  static final darkTheme = (context) => ThemeData.dark().copyWith(
        primaryColor: Color(0xFF3B5998),
        buttonColor: Color(0xFF3B5998),
        accentColor: Color(0xFF8B9DC3),
        backgroundColor: Color(0xFFFFFFFF),
      );
}
