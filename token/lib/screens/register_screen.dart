import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token/providers/login_form_provider.dart';
import 'package:token/widgets/widgets.dart';

import '../ui/input_decoration.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250),
                  CardContainer(
                    child: (Column(
                      children: [const SizedBox(height: 10), 
                                Text("Register", style: Theme.of(context).textTheme.headline4),
                                ChangeNotifierProvider(create: ( _ )=> LoginFormProvider(),
                                  child: LoginForm(),)]
                      )
                    ),
                  ),
                  const SizedBox(height: 50,),

                  //En caso de tener una cuenta te regresa al login
                  TextButton(
                    style: ButtonStyle(
                      shape:MaterialStateProperty.all(const StadiumBorder()),
                      overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1))
                      ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, "login");
                    }, 
                    child: const Text("¿Ya tienes una cuenta?", 
                    style: TextStyle(
                      color: Colors.black54, 
                      fontSize:18))

                  ),
                ],
              ),
            )
          ),
        ),
    );
  }
}
