import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';

import '../../../../core/widgets/textstyle.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({
    super.key,
    required this.size,
  });

  final Size size;

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
          height: size.height * 0.305,
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
                          child: Image.asset(
                            'assets/images/event2.png',
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
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const TextStyleWidget(
                              title: 'Mark Zuckerbrg',
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
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: kBrown,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: () {},
                          child: TextStyleWidget(
                            title: 'Join Now',
                            thick: FontWeight.w600,
                            textcolor: kCream,
                            fontsize: 14,
                          ),
                        ),
                      ),
                      TextStyleWidget(
                        title: 'Thursday, March 2',
                        thick: FontWeight.w600,
                        textcolor: kCream,
                        fontsize: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
