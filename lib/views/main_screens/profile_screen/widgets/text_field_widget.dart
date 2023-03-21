import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormWidget extends StatelessWidget {
  TextFormWidget({
    required this.validator,
    required this.controller,
    required this.hinttext,
    super.key,
  });
  final String hinttext;
  final TextEditingController controller;
  String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: hinttext,
      ),
      style: const TextStyle(fontSize: 14),
    );
  }
}
