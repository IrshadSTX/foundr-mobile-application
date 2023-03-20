import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/profile/profile_screen_provider.dart';
import 'package:provider/provider.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    required this.controller,
    required this.hinttext,
    super.key,
  });
  final String hinttext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileScreenProvider>(context, listen: false);
    return TextFormField(
      controller: controller,
      validator: (value) => provider.checkingEmpty(value),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: hinttext,
      ),
      style: TextStyle(fontSize: 14),
    );
  }
}
