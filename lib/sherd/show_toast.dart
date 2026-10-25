import 'package:flutter/material.dart';

import '../main.dart';

void showMassage(String? message, {bool isError = true}) {
  if (message == null || message.trim().isEmpty) {
    return;
  }
  final context = navigatorKey.currentContext;
  if (context == null) return;

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      content: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 4),
    ),
  );
}
