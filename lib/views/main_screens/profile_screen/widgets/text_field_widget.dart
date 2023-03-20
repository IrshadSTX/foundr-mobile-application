import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/profile/profile_screen_provider.dart';
import 'package:provider/provider.dart';

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
    final provider = Provider.of<ProfileScreenProvider>(context, listen: false);
    return TextFormField(
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
