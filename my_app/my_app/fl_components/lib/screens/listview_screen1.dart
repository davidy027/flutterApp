import 'package:flutter/material.dart';

class ListviewScreen1 extends StatelessWidget {
  final options = const [
    "Megaman",
    "Metal Gear",
    "Super Smash",
    "Final Fantasy"
  ];

  const ListviewScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("listview tipo 1"),
        ),
        body: ListView(
          children: [
            ...options
                .map((game) => ListTile(
                      title: Text('$game'),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ))
                .toList()
          ],
        ));
  }
}
