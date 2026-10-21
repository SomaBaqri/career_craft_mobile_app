import 'package:flutter/material.dart';
class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, required this.label, this.controller, this.obscureText = false, this.validator, this.keyboardType});
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, obscureText: obscureText, validator: validator, keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }
}
