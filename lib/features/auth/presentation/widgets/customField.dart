import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;

  const CustomField({
    super.key,
    required this.controller,
    this.label = 'Email',
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText ?? 'example@email.com',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}
