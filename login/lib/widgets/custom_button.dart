import 'package:flutter/material.dart';
import 'package:login/themes/app_theme.dart';

import '../screens/screens.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
    required this.sized,
  }) : super(key: key);

  final Size sized;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(0, 255, 255, 255),
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
              
              ),
              onPressed: () {print("Recuperar contraseña");},
              child: const Text("Has olvidado tu contraseña", style: TextStyle(color: AppTheme.primary),
              )
            ),
        ),

          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(0, 255, 255, 255),
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
            ),
            onPressed: () {print("Registrate");},
            child: const Text("Registrate", style: TextStyle(color: AppTheme.primary),
            )
          ),

        const SizedBox(height: 50),

      ],
    );
  }
}




        // ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //         backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        //         foregroundColor: const Color.fromARGB(0, 255, 255, 255),
        //         shadowColor    : const Color.fromARGB(0, 255, 255, 255),
                
        //         ),
        //     onPressed: () {print("Registrate");},
        //     child: SizedBox(
        //       width: sized.width * 0.2,
        //       child: const Center(child: Text("registrate", style: TextStyle (color: Colors.black, fontSize: 15),)),
        //     )
        // ),