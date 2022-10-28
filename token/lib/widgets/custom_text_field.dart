import 'package:flutter/material.dart';
import 'package:token/providers/login_form_provider.dart';

import '../ui/input_decoration.dart';

class CustomTextField extends StatelessWidget {

  final bool autocorrect;
  final String labelText;
  final String hintText;
  final bool obscure;
  final IconData prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;



  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon, 
    this.autocorrect = false,
    this.onChanged, 
    this.obscure = false, 
    this.validator, 
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: autocorrect,
      obscureText: obscure, 
      decoration: InputDecorations.loginInputDecoration(hintText: hintText, labelText: labelText, prefixIcon: prefixIcon),
      onChanged: onChanged,
      validator: validator
      );
  }
}
