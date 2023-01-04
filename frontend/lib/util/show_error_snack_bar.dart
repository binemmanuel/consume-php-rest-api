import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

void showErrorSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Material(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              const Icon(Ionicons.warning_outline, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                message,
                style: const TextStyle(color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
      padding: const EdgeInsets.all(0),
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}
