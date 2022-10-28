import 'package:flutter/material.dart';

import '../widgets/custom_input_field.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
    };


    return Scaffold(
        appBar: AppBar(title: const Text("Inputs y Forms")),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: myFormKey,
                child: Column(
                  children: [
                    customTextField(labelText: "Nombre",hintText: "Nombre del usuario", formProperty: 'first_name', formValues: formValues,),
                    const SizedBox(height: 20),
              
                    customTextField(labelText: "Apellido",hintText: "Apellido del usuario", formProperty: 'last_name', formValues: formValues,),
                    const SizedBox(height: 20),
                    
                    customTextField(labelText: "Email",hintText: "Email del usuario",keyboard:TextInputType.emailAddress, formProperty: 'email', formValues: formValues),
                    const SizedBox(height: 20),
                    
                    customTextField(labelText: "Password",hintText: "Contraseña del usuario", password: true, formProperty: 'password', formValues: formValues,),
                    const SizedBox(height: 20),

                    DropdownButtonFormField(items: const[
                      DropdownMenuItem(value: "Admin", child: Text("admin")),
                      DropdownMenuItem(value: "Super User", child: Text("super user")),
                      DropdownMenuItem(value: "jr developer", child: Text("jr developer"))

                    ], onChanged: (value){
                      print(value);
                      formValues["role"] = value ?? "admin";
                    }),
              
                    ElevatedButton(child: const SizedBox(width: double.infinity, child: Center(child: Text("Guardar")),),onPressed: (){

                      FocusScope.of(context).requestFocus(FocusNode());

                      if (!myFormKey.currentState!.validate()){
                        print("formulario no valido");
                        return;
                      }

                      print(formValues);
                    })
              
                    
              
                  ],
                ),
              )),
        ));
  }
}
