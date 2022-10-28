import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
        unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
        selectedItemColor: Colors.pink,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: "calenadrio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outline_outlined), label: "grafica"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_sharp), label: "usuario"),
        ]);
  }
}
