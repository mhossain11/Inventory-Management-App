import 'package:flutter/material.dart';

void showCustomSnackBar(
    BuildContext context,
    String message, {
      Color backgroundColor = Colors.black,
      IconData icon = Icons.info,
      Duration duration = const Duration(seconds: 2),
    }) {
  final snackBar = SnackBar(
    duration: duration,
    behavior: SnackBarBehavior.floating, // floating look
    backgroundColor: Colors.transparent, // for custom shape
    elevation: 0,
    content: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
