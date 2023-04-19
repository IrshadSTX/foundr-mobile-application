import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/chat/messaging_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/textstyle.dart';

Widget replayCardWidget(context, String msg, String time) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Container(
            decoration: BoxDecoration(
                color: kGreen, borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    msg,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextStyleWidget(
                      title: Provider.of<MessagingUserProvider>(context,
                              listen: false)
                          .dateChange(time),
                      thick: FontWeight.w500,
                      textcolor: kCream,
                      fontsize: 10)
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}
