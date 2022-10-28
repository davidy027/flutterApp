import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:token/providers/login_form_provider.dart';
import 'package:token/services/services.dart';

import 'package:token/widgets/widgets.dart';
import '../ui/input_decoration.dart';

class LoginForm extends StatelessWidget {

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


              CustomTextField(
              labelText: 'email',
              hintText: 'usuario@gmail.com',
              prefixIcon: Icons.alternate_email_sharp,
              onChanged: (value){
                loginForm.email = value;
              },
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '') ? null : 'El valor ingresado no luce como un correo';
              }
            ),

            
            const SizedBox(height: 30),

            CustomTextField(
              obscure: true,
              labelText: 'password',              
              hintText: 'minimun 6 character',
              prefixIcon: Icons.ac_unit_outlined,
              onChanged: (value) {
                loginForm.password = value;
              },
              validator: (value) => value != null && value.length >=6 ? null : "La contraseña tiene que ser de 6 caracteres",
            ),


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
                final String? errorMessage = await authService.createUser(loginForm.email, loginForm.password);

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
