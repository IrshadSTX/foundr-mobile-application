import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';

Widget sendCardWidget(context, String msg) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Container(
            decoration: BoxDecoration(
                color: kRoseCream, borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                msg,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
