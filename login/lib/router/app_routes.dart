import 'package:flutter/material.dart';


import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes{

  //Aqui se define la ruta inicial de la aplicacion que sera la pantalla de home/Log-in
  static const initialRoute = "home";


  //Aqui se crea un metodo estatico para agregar nuevas rutas/screen si en caso se requiere
  static final menuOptions = <MenuOption>[
    MenuOption(route: "calendario", icon: Icons.calendar_month_rounded, name: "Calendario", screen:  CalendarioScreen ())
  ];


  //Aqui se llena el mapa/diccionario con las rutas existentes
  static Map<String, Widget Function(BuildContext)> getAppRoutes (){
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({"home":(BuildContext context) => const HomeScreen()});

    for (final option in menuOptions){
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  //Aqui se muestra una pantalla predeterminado en caso que haya un problema o que no exista la ruta/screen

  static Route<dynamic> onGenerateRoute (RouteSettings settings){
    return MaterialPageRoute(builder: (context) => const NotFoundScreen(),);
  }

}