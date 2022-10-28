import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token/services/auth_user.dart';

class HomeScreen extends StatelessWidget {

   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

  final authService = Provider.of<AuthService>(context, listen: false);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos"),
        leading: IconButton(icon: const Icon(Icons.login_outlined), onPressed: () { 
          authService.logout();
          Navigator.pushReplacementNamed(context, "login");
         }, ),
      ),
      body: const Center(
         child: Text('HomeScreen'),
      ),
    );
  }
}