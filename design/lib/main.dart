import 'package:design/src/basic_design.dart';
import 'package:design/src/home_screen.dart';
import 'package:design/src/scroll_design.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "home_screen",
      routes: {
        "basic_design": (_) => BasicDesignScreen(),
        "scroll_design": (_) => ScrollDesignScreen(),
        "home_screen": (_) => HomeScreen()

      },
      
    );
  }
}