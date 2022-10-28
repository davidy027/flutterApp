import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:fl_components/screens/screens.dart';
import 'package:fl_components/models/menu_option.dart';
import 'package:fl_components/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menu = AppRoutes.menuOptions; 


    return Scaffold(
        appBar: AppBar(
          title: const Text("Componente en Flutter"),
          centerTitle: true,
        
        ),
        body: ListView.separated(
            itemBuilder: ((context, index) => ListTile(
                  leading: Icon(menu[index].icon, color: AppTheme.primary),
                  title: Text(menu[index].name),
                  onTap: () {
                    // final route = MaterialPageRoute(
                    //     builder: (context) => const ListviewScreen1());
                    // Navigator.push(context, route);
                    Navigator.pushNamed(context, menu[index].route);
                  },
                )),
            separatorBuilder: ((context, index) => const Divider()),
            itemCount: menu.length));
  }
}
