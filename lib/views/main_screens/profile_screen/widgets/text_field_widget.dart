import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormWidget extends StatelessWidget {
  TextFormWidget(
      {this.validator,
      this.controller,
      this.hinttext,
      super.key,
      this.linesCount});
  final String? hinttext;
  final TextEditingController? controller;
  String? Function(String?)? validator;
  int? linesCount;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: linesCount,
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
