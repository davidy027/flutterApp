import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token/providers/login_form_provider.dart';
import 'package:token/widgets/widgets.dart';

import '../services/services.dart';
import '../ui/input_decoration.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
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
                                Text("Login", style: Theme.of(context).textTheme.headline4),
                                ChangeNotifierProvider(create: ( _ )=> LoginFormProvider(),
                                  child: _LoginForm(),
                                )
                                
                                ]
                      )
                    ),
                  ),
                  const SizedBox(height: 50,),
                  TextButton(
                    style: ButtonStyle(
                      shape:MaterialStateProperty.all(const StadiumBorder()),
                      overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1))
                      ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, "register");
                    }, 
                    child: const Text("Crea una cuenta", 
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

class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);


    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress, 
              decoration: InputDecorations.loginInputDecoration(hintText: 'usuario@gmail.com', labelText: 'Email', prefixIcon: Icons.alternate_email_sharp),
              onChanged: (value){
                loginForm.email = value;
              },
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '') ? null : 'El valor ingresado no luce como un correo';
              },
              ),

            const SizedBox(height: 30),

            TextFormField(
              autocorrect: false,
              obscureText: true, 
              decoration: InputDecorations.loginInputDecoration(hintText: 'minimun 6 character', labelText: 'password', prefixIcon: Icons.lock_outline),
              onChanged: (value) {
                loginForm.password = value;
              },
              validator: (value) {
                return value != null && value.length >=6 ? null : "La contraseña tiene que ser de 6 caracteres"; 
              },),


            const SizedBox(height: 30),

            MaterialButton(
              color: Colors.deepPurple,
              disabledColor: Colors.grey, 
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              onPressed: loginForm.isLoading? null : ()async {
               
                 FocusScope.of(context).unfocus();

                final authService = Provider.of<AuthService>(context, listen: false);

                if (!loginForm.isValidForm()) return;

                loginForm.isLoading = true;

                //validar si el Login es correcto
                final String? errorMessage = await authService.login(loginForm.email, loginForm.password);

                if (errorMessage == null){
                Navigator.pushReplacementNamed(context, "home");
                } 
                else{
                  NotificationsService.showSnackbar(errorMessage);
                  print(errorMessage);
                  loginForm.isLoading = false;
                }
              },
              child: Text(!loginForm.isLoading ? "Login":" espere", style: const TextStyle(color: Colors.white),))
          
        ]) 
      ),
    );
  }
}
