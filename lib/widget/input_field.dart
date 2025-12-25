import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final controller, keyboardType, hint, label, errorText, icon, validator;
  const InputField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hint,
    this.label,
    this.errorText,
    required this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: keyboardType == TextInputType.visiblePassword ? true : false,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
