import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

// ignore: must_be_immutable
class CardButtonWidget extends StatelessWidget {
  CardButtonWidget({super.key, required this.title, this.navigate});
  final String title;
  Widget? navigate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigate!)),
      child: Card(
        elevation: 5,
        color: kYellow,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.brown, width: 1),
          borderRadius: BorderRadius.circular(10),
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
