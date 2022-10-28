import 'package:fl_components/models/models.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {

  static const initialRoute = "home";
  static final menuOptions = <MenuOption>[
//    MenuOption(route: "home", icon: Icons.home_max_sharp, name:"Home Screen" , screen: const HomeScreen()),
    MenuOption(route: "listview1", icon: Icons.library_books, name:"List view1" , screen: const ListviewScreen1()),
    MenuOption(route: "listview2", icon: Icons.library_add_check, name:"List view2" , screen: const ListviewScreen2()),
    MenuOption(route: "alert", icon: Icons.bus_alert, name:"alert" , screen: const AlertScreen()),
    MenuOption(route: "card", icon: Icons.card_giftcard, name:"card" , screen: const CardScreen()),
    MenuOption(route: "avatar", icon: Icons.supervised_user_circle, name:"Avatar" , screen: const AvatarScreen()),
    MenuOption(route: "animation", icon: Icons.airline_stops, name:"Animation" , screen: const AnimatedScreen()),
    MenuOption(route: "inputs", icon: Icons.input_rounded, name:"Text Inputs" , screen: const InputScreen()),
    MenuOption(route: "slider", icon: Icons.slow_motion_video_sharp, name:"Slider" , screen: const SliderScreen()),
    MenuOption(route: "List_view_builder", icon: Icons.list_alt, name: "infiniteScrol & Pull to refresh", screen: ListViewBuilderScreen())


  ];

static Map<String, Widget Function (BuildContext)> getAppRoutes(){

  Map<String, Widget Function (BuildContext)> appRoutes = {};

  appRoutes.addAll({"home" : (BuildContext context) => const HomeScreen() });

  for (var option in menuOptions) {
    appRoutes.addAll({ option.route: (BuildContext context)=> option.screen});
    
  }

  return appRoutes;
}


  // static Map<String, Widget Function (BuildContext)> routes = {
  //       "home"     : (BuildContext context)=> const HomeScreen(),
  //       "listview1": (BuildContext context)=> const ListviewScreen1(),
  //       "listview2": (BuildContext context)=> const ListviewScreen2(),
  //       "alert"    : (BuildContext context)=> const AlertScreen(),
  //       "card"     : (BuildContext context)=> const CardScreen()
  // };

  static Route<dynamic> ongenerateRoute (RouteSettings settings) => MaterialPageRoute(builder: (context) => const AlertScreen());
}
