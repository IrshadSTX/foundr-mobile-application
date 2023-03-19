import 'package:flutter/material.dart';
import 'package:foundr_project/core/constants.dart';

class FieldsInRowWidget extends StatelessWidget {
  const FieldsInRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintText: 'Gender',
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ),
        kWidth10, // Add some space between text fields
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintText: 'Age',
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ),
        kWidth10, // Add some space between text fields
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintText: 'Nation',
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
