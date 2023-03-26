import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/widgets/textstyle.dart';

class CoFounderScreen extends StatelessWidget {
  const CoFounderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextStyleWidget(
            title: 'Co-Founder',
            thick: FontWeight.bold,
            textcolor: Colors.white,
            fontsize: 22),
        backgroundColor: kYellow,
      ),
    );
  }
}
