import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/chat/messaging_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:provider/provider.dart';

Widget sendCardWidget(context, String msg, String time) {
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
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    msg,
                    style: const TextStyle(color: kBrown, fontSize: 16),
                  ),
                  TextStyleWidget(
                      title: Provider.of<MessagingUserProvider>(context,
                              listen: false)
                          .dateChange(time),
                      thick: FontWeight.w500,
                      textcolor: kGreen,
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
