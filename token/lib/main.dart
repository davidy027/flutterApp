import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token/services/auth_user.dart';
import 'package:token/services/services.dart';


import 'screens/screens.dart';

void main() => runApp(AppState());


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> AuthService())
    ],
    child: MyApp(),
    );
  }
}






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alamos App',
      initialRoute: "checking",
      scaffoldMessengerKey: NotificationsService.messengerKey,
      routes: {
        
        "checking": (_) =>  CheckAuthScreen(),
        "home": (_) =>  HomeScreen(),

        "login": (_) => LoginScreen(),
        "register": (_) => RegisterScreen(),

      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300]
      ),
    );
  }
}