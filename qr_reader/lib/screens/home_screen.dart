import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_reader/providers/dv_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/screens/screens.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Historial"),
          actions: [
            IconButton(icon: const Icon(Icons.delete_forever), onPressed: () {})
          ]),
      body: _HomePagesBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}


class _HomePagesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOption;

    final tempScan = new ScanModel(valor: 'http://google.com');
    DBProvider.db.nuevoScan(tempScan);

    switch( currentIndex){
      case 0:
        return MapsScreen();
      
      case 1:
        return DirectionsScreen();
    }
    return MapsScreen();
  }
}