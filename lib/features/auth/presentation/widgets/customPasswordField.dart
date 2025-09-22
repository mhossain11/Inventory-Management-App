import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;

  const CustomPasswordField({
    super.key,
    required this.controller,
    this.label = 'Password',
    this.hintText,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText ?? 'Enter your password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}
