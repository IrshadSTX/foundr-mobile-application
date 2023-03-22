import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/views/main_screens/event_screen/widgets/event_join_screen.dart';

import '../../../../core/widgets/textstyle.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({
    required this.eventId,
    required this.joinLink,
    super.key,
    required this.size,
    required this.celebrity,
    required this.image,
    required this.date,
    required this.content,
    required this.venue,
    required this.fee,
    required this.title,
  });
  final String celebrity;
  final String image;
  final String date;
  final Size size;
  final String content;
  final String venue;
  final int fee;
  final String title;
  final String eventId;
  final String joinLink;
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
          // height: size.height * 0.305,
          width: size.width * 0.85,
          decoration: BoxDecoration(
              color: kRose, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.83,
                  // height: size.width * 0.43,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: size.width * 0.83,
                          // height: size.width * 0.43,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/community.png',
                              image: image,
                              fit: BoxFit.cover,
                              fadeInDuration: const Duration(milliseconds: 500),
                            ),
                          )),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: size.width * 0.83,
                          height: size.width * 0.10,
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, top: 5),
                            child: TextStyleWidget(
                              title: celebrity,
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventJoinScreen(
                                  image: image,
                                  title: title,
                                  content: content,
                                  mentorImage: image,
                                  mentorName: celebrity,
                                  venue: venue,
                                  dateAndTime: date,
                                  fee: fee,
                                  eventId: eventId,
                                  joinLink: joinLink,
                                ),
                              ),
                            );
                          },
                          child: const TextStyleWidget(
                            title: 'Join Now',
                            thick: FontWeight.w600,
                            textcolor: kCream,
                            fontsize: 14,
                          ),
                        ),
                      ),
                      TextStyleWidget(
                        title: date,
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
