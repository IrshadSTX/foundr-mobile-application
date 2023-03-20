import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/profile_screen/widgets/card_button_widget.dart';

class BottomButtonsWidget extends StatelessWidget {
  const BottomButtonsWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight10,
        const TextStyleWidget(
            title: 'More Details',
            thick: FontWeight.bold,
            textcolor: kBrown,
            fontsize: 18),
        kHeight10,
        Row(
          children: [
            CardButtonWidget(
              title: 'About Me',
              onPressed: () {},
            ),
            kWidth10,
            CardButtonWidget(
              title: 'Co-Founder',
              onPressed: () {},
            )
          ],
        ),
        kHeight5,
        SizedBox(
          width: size.width * 0.9,
          child: const Text(
            'Co-Founder Matches will be found according to the details provided in the About me and Co-Founder sections',
            style: TextStyle(
                color: kGreen, fontSize: 12, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
