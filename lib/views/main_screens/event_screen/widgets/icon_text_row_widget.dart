import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    super.key,
    required this.icons,
    required this.text,
  });
  final String text;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Icon(
            icons,
            color: kRose,
            size: 25,
          ),
          kWidth20,
          TextStyleWidget(
              title: text,
              thick: FontWeight.w600,
              textcolor: kBrown,
              fontsize: 16)
        ],
      ),
    );
  }
}
