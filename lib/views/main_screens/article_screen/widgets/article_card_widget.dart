import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

class ArticleCardWIdget extends StatelessWidget {
  const ArticleCardWIdget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.30,
      width: size.width * 0.85,
      decoration:
          BoxDecoration(color: kRose, borderRadius: BorderRadius.circular(15)),
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
                      child: Image.asset(
                        'assets/images/events.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: size.width * 0.83,
                      height: size.width * 0.09,
                      decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const TextStyleWidget(
                        title: 'How to get startup ideas',
                        thick: FontWeight.bold,
                        textcolor: kCream,
                        fontsize: 18,
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
                children: const [
                  TextStyleWidget(
                      title: 'Thursday, March 2',
                      thick: FontWeight.w600,
                      textcolor: kCream,
                      fontsize: 16)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
