import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';

Widget replayCardWidget(context, String msg) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Container(
            decoration: BoxDecoration(
                color: kCream, borderRadius: BorderRadius.circular(5)),
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