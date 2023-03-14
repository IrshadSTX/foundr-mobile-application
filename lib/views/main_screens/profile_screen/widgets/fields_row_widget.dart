import 'package:flutter/material.dart';

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
            style: TextStyle(fontSize: 14),
          ),
        ),
        SizedBox(width: 10), // Add some space between text fields
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
            style: TextStyle(fontSize: 14),
          ),
        ),
        SizedBox(width: 10), // Add some space between text fields
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
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
