import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/article_screen/widgets/article_card_widget.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kYellow,
        title: const TextStyleWidget(
          title: 'Articles',
          thick: FontWeight.bold,
          textcolor: Colors.white,
          fontsize: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 35,
            ),
          ),
        ],
      ),
      backgroundColor: kCream,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            kHeight10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextStyleWidget(
                  title: 'Gain some ideas!',
                  thick: FontWeight.bold,
                  textcolor: kBrown,
                  fontsize: 24,
                ),
                TextStyleWidget(
                  title:
                      "Read Articles and gain ideas about different sections of strtups.",
                  thick: FontWeight.w500,
                  textcolor: kGreen,
                  fontsize: 12,
                ),
              ],
            ),
            kHeight20,
            Card(
              color: kRose,
              elevation: 6,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ArticleCardWIdget(size: size),
            )
          ],
        ),
      ),
    );
  }
}
