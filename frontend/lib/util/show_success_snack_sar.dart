import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

void showSuccessSnackBar(BuildContext context, {required message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Material(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(10),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              const Icon(Ionicons.checkmark_outline, color: Colors.black),
              const SizedBox(width: 10),
              Text(message, style: const TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
      padding: const EdgeInsets.all(0),
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}
