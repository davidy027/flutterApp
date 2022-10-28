import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

      const fontSize30 = const TextStyle( fontSize: 30);

      return Scaffold(
        appBar: AppBar(
          title: const Text("HomeScreen"),
          elevation: 10,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text("Numero de clicks", style: fontSize30),
              Text("10", style: fontSize30)
            ],
  
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            print("object");
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      );
     }

}

