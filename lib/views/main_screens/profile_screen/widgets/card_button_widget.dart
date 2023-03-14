import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

class CardButtonWidget extends StatelessWidget {
  const CardButtonWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 5,
        color: kYellow,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.brown, width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
        child: SizedBox(
          height: 45,
          width: 160,
          child: Center(
            child: TextStyleWidget(
              title: title,
              thick: FontWeight.w700,
              textcolor: Colors.white,
              fontsize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
