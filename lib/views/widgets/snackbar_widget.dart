import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';

class SnackbarPopUps {
  static Future<void> popUpB(String text, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: kRose,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static Future<void> popUpG(String text, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: kGreen,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
