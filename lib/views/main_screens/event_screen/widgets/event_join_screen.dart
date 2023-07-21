import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/event/event_payment_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/event_screen/widgets/icon_text_row_widget.dart';
import 'package:provider/provider.dart';

class EventJoinScreen extends StatelessWidget {
  const EventJoinScreen({
    required this.eventId,
    required this.joinLink,
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.mentorImage,
    required this.mentorName,
    required this.venue,
    required this.dateAndTime,
    required this.fee,
  });
  final String image;
  final String title;
  final String joinLink;
  final String content;
  final String mentorImage;
  final String mentorName;
  final String venue;
  final String dateAndTime;
  final int fee;
  final String eventId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kYellow,
          title: TextStyleWidget(
              title: 'Book your Event',
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
                    kHeight20,
                    TextStyleWidget(
                        title: title,
                        thick: FontWeight.bold,
                        textcolor: kBrown,
                        fontsize: 22),
                    TextStyleWidget(
                      title: content,
                      thick: FontWeight.w500,
                      textcolor: kGreen,
                      fontsize: 12,
                    ),
                    kHeight20,
                    IconTextWidget(
                      icons: Icons.mic_none,
                      text: mentorName,
                    ),
                    kHeight5,
                    const IconTextWidget(
                      icons: Icons.discord,
                      text: 'Discord',
                    ),
                    kHeight5,
                    IconTextWidget(
                      icons: Icons.calendar_month,
                      text: dateAndTime,
                    ),
                    kHeight40,
                    TextStyleWidget(
                      title: "Join now for just  \$$fee dollars!",
                      thick: FontWeight.w600,
                      textcolor: Colors.black,
                      fontsize: 14,
                    ),
                    TextStyleWidget(
                      title: 'get the invitation link to the registered email',
                      thick: FontWeight.w500,
                      textcolor: kGreen,
                      fontsize: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              double exchangeRate = 73;
                              double rupeeAmount = fee * exchangeRate;
                              log(rupeeAmount.toString());
                              Provider.of<EventPaymentProvider>(context,
                                      listen: false)
                                  .openCheckout(
                                rupeeAmount,
                                eventId,
                                joinLink,
                                context,
                              );
                            },
                            child: const Text('Join in Discord')),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
