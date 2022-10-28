import 'package:flutter/material.dart';

class ListviewScreen2 extends StatelessWidget {
  final options = const [
    "Megaman",
    "Metal Gear",
    "Super Smash",
    "Final Fantasy"
  ];

  const ListviewScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("listview tipo 2"),

        ),
        body: ListView.separated(
            itemCount: options.length,
            itemBuilder: (context, index) => ListTile(title: Text(options[index]),trailing: const Icon(Icons.arrow_back_ios_outlined, color: Colors.indigo,),
            onTap: ()=>print(options[index]),),
            separatorBuilder: (_, __) => const Divider()));
  }
}
