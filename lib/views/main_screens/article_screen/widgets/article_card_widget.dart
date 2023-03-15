import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/views/main_screens/article_screen/article_content/article_content_screen.dart';

import '../../../../core/widgets/textstyle.dart';

class ArticleCardWidget extends StatelessWidget {
  const ArticleCardWidget({
    super.key,
    required this.size,
    required this.avatar,
    required this.title,
    required this.dateTime,
  });

  final Size size;
  final String avatar;
  final String title;

  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: kRose,
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          height: size.height * 0.30,
          width: size.width * 0.85,
          decoration: BoxDecoration(
              color: kRose, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.83,
                  height: size.width * 0.43,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: size.width * 0.83,
                        height: size.width * 0.43,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            avatar,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: size.width * 0.83,
                          height: size.width * 0.10,
                          decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, top: 5),
                            child: TextStyleWidget(
                              title: title,
                              thick: FontWeight.bold,
                              textcolor: kCream,
                              fontsize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextStyleWidget(
                          title: dateTime,
                          thick: FontWeight.w600,
                          textcolor: kCream,
                          fontsize: 16)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
