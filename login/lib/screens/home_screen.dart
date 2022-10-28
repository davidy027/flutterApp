import 'package:flutter/material.dart';
import 'package:login/screens/screens.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home_fondo.jpg"),
                  fit: BoxFit.cover)
              ),
 
          child: Column(
            //Esto hace que los objetos esten centrados
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,  

            //Aqui se definen los objetos de la columna principal
            children: <Widget>[
              //Aqui se almacenan los inputs              
              Column(
                children: const [

                  //Aqui se muestra el primer input para ingresar el email
                  CustomInputField(hintText: "Ingrese su usuario o Email", keyboardType: TextInputType.emailAddress, labelText: "Email",),

                  //Aqui se deja una separación
                  SizedBox(height: 25),

                  //Aqui se muestra el primer input para ingresar el email
                  CustomInputField(labelText: "Password",obscureText: true,),
                ],
              ),

              const SizedBox(height: 15),

              Buttons(sized: size),

            ElevatedButton(onPressed: () {   
            final route = MaterialPageRoute(builder: (context) =>  const CalendarioScreen());
            Navigator.push(context, route);
            },
            child: const SizedBox(width: 100, child: Center(child: Text("Login")), )
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}


