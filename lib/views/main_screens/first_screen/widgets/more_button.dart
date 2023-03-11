import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

class MoreButtonWidget extends StatelessWidget {
  const MoreButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
            onTap: () {},
            child: const TextStyleWidget(
              title: 'more',
              thick: FontWeight.w600,
              textcolor: kGreen,
              fontsize: 14,
            )),
      ],
    );
  }
}
