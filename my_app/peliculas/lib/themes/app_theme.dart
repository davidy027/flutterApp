import 'package:flutter/material.dart';

class AppTheme{
  static const Color primary = Colors.indigo; 

  static final ThemeData ligthTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary
    ),


  );
}