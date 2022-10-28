import 'package:flutter/material.dart';


import 'package:login/screens/screens.dart';
import 'package:login/themes/app_theme.dart';
import '../widgets/widgets.dart';

class CalendarioScreen extends StatelessWidget {
  const CalendarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendario"),
        centerTitle: true,
      ),
      
      //Aqui se dibuja el calendario
      body: const CalendarWidget(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            final route = MaterialPageRoute(builder: (context) => appointment());
            Navigator.of(context).push(route);
          }),
    );
  }
}
