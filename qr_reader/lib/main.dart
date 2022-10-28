import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/theme/app_theme.dart';
import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new UiProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: "home",
        routes: {
          "home": ( _ ) => HomeScreen(),
          "mapa": ( _ ) => MapScreen(),
    
        },
        theme: Apptheme.lightTheme,
      ),
    );
  }
}

