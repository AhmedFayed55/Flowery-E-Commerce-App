import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final VoidCallback?
  onChanged; 

  final TextEditingController? passwordCompareValue;
  final String? Function(String?, TextEditingController?)?
  confirmPasswordFunction; 
  final bool? obsecureTxt;
  final String? Function(String?)? validator;
   final TextInputType? keyboardType ;

  const CustomTextFormField({
    super.key,
    this.validator,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.passwordCompareValue,
    this.obsecureTxt,
    this.confirmPasswordFunction,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      controller: controller,
      obscureText: obsecureTxt ?? false,
      onChanged: (_) {
        if (onChanged != null) {
          onChanged!();
        }
      },

      decoration: InputDecoration(
      
        contentPadding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 18),
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      validator: validator
    );
  }
}
