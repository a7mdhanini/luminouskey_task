import 'package:flutter/material.dart';

void myMessenger(BuildContext context, String msg,
    {Color color = Colors.blue}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          msg,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color),
  );
}
