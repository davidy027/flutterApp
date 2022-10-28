import 'package:flutter/material.dart';

class Apptheme {
  static const Color primary = Colors.deepPurpleAccent;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    

    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
    floatingActionButtonTheme: const FloatingActionButtonThemeData (elevation: 0, backgroundColor: primary),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 0, selectedItemColor: primary)


  );


}