import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

class CardDetailsWidget extends StatelessWidget {
  const CardDetailsWidget({
    required this.title,
    required this.subtitle,
    super.key,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
          margin: const EdgeInsets.all(15),
          width: 250,
          child: Column(
            children: [
              TextStyleWidget(
                title: title,
                thick: FontWeight.bold,
                textcolor: kBrown,
                fontsize: 18,
              ),
              TextStyleWidget(
                title: subtitle,
                thick: FontWeight.w600,
                textcolor: kGreen,
                fontsize: 12,
              ),
            ],
          )),
    );
  }
}
