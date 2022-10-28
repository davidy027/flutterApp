import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

final String? helperText;
final String? hintText;
final IconData? icon;
final TextInputType? keyboardType;
final String? labelText;
final bool obscureText;
final IconData? suffixIcon;
final double? porcentageWidth;

  const CustomInputField({
    super.key, 
    this.helperText,
    this.hintText, 
    this.icon, 
    this.keyboardType, 
    this.labelText, 
    this.obscureText = false,
    this.suffixIcon,
    this.porcentageWidth = 0.5,
    
    });
 

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    
    return SizedBox(
      width: size.width * porcentageWidth!,
      child: TextFormField(
        autofocus: false,
        initialValue: "",
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: (value) => {print(value)},
        validator: (value){
          if (value == null) return "Este campo es requerido";
          return value.length < 3 ? "Minimo de 3 letras": null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          ),

      ),
    );
  }
}