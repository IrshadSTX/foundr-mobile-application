import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/model/api/events/events_model.dart';
import 'package:foundr_project/services/event_services/event_services.dart';
import 'package:foundr_project/views/main_screens/event_screen/widgets/events_card_widget.dart';
import 'package:intl/intl.dart';

import '../../../core/constants.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kYellow,
        title: const TextStyleWidget(
          title: 'Events',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              const TextStyleWidget(
                title: 'Join Now!',
                thick: FontWeight.bold,
                textcolor: kBrown,
                fontsize: 24,
              ),
              const TextStyleWidget(
                title:
                    "Game-Changing Advice from Founders Who have made millions",
                thick: FontWeight.w500,
                textcolor: kGreen,
                fontsize: 12,
              ),
              kHeight20,
              SizedBox(
                child: FutureBuilder<List<EventModel>?>(
                    future: EventService().getEventService(context),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => EventCardWidget(
                              size: size,
                              celebrity: snapshot.data![index].mentorName!,
                              image: snapshot.data![index].mentorImage!,
                              date: dateChange(snapshot.data![index].dateAndTime
                                  .toString())),
                          itemCount: snapshot.data!.length,
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dateChange(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatteddate = DateFormat('dd-MMMM-yyyy', 'en_US').format(dateTime);
    String time = DateFormat('h:mm a').format(dateTime);
    formatteddate = formatteddate.toLowerCase();
    String formattedDate = formatteddate.replaceFirst(
        formatteddate.substring(3, 4),
        formatteddate.substring(3, 4).toUpperCase());
    String timeDate = formattedDate + " " + time;
    return timeDate;
  }
}
