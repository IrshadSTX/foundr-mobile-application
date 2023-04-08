import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

class ArticleContentScreen extends StatelessWidget {
  const ArticleContentScreen(
      {super.key,
      required this.content,
      required this.name,
      required this.date,
      required this.image});
  final String name;
  final String content;
  final String image;
  final String date;

  @override
  Widget build(BuildContext context) {
    String htmlContent = content;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kYellow,
          title: const TextStyleWidget(
              title: 'Article-Home',
              thick: FontWeight.bold,
              textcolor: Colors.white,
              fontsize: 20),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                image,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextStyleWidget(
                            title: 'Published : $date',
                            thick: FontWeight.bold,
                            textcolor: kRose,
                            fontsize: 12),
                      ],
                    ),
                    TextStyleWidget(
                        title: name,
                        thick: FontWeight.bold,
                        textcolor: kBrown,
                        fontsize: 26),
                    Html(
                      data: htmlContent,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
