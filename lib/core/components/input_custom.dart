import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const InputCustom({
    required this.label,
    this.controller,
    this.keyboardType,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        label: Text(label),
      ),
    );
  }
}
