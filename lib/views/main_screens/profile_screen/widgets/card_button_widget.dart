import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/provider/bottom_navigation.dart/bottom_navigation.dart';

// ignore: must_be_immutable
class CardButtonWidget extends StatelessWidget {
  CardButtonWidget({
    super.key,
    required this.title,
    this.navigate,
  });
  final String title;
  Widget? navigate;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => navigate != null
          ? Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigate!))
          : changer(context),
      child: Card(
        elevation: 5,
        color: kYellow,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.brown, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: 45,
          width: size.width * 0.4,
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

  void changer(context) {
    Provider.of<NavigationBarProvider>(context, listen: false)
        .setCurrentPage(3);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
