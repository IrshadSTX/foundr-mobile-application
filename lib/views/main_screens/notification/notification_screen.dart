import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/notification/notification_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  String? userId;
  @override
  Widget build(BuildContext context) {
    Provider.of<NotificationProvider>(context)
        .getAllNotificationProvider(context);
    return Scaffold(
      backgroundColor: kCream,
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: kYellow,
          title: const TextStyleWidget(
              title: 'Notifications',
              thick: FontWeight.bold,
              textcolor: Colors.white,
              fontsize: 20)),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight5,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                child: Consumer<NotificationProvider>(
                  builder: (context, value, child) {
                    if (value.notificationData == null ||
                        value.notificationData!.isEmpty) {
                      return const Center(
                        child: Text(
                          "No Notification",
                          style: textstyle,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.notificationData!.length,
                        itemBuilder: (context, index) {
                          final data = value.notificationData![index];
                          return Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: data
                                                .sender!.profilePhoto ==
                                            null
                                        ? Image.asset('assets/images/user.png')
                                            .image
                                        : Image.network(
                                                data.sender!.profilePhoto!)
                                            .image),
                              ),
                              title: textMiniHeading2(
                                data.sender!.userName ?? 'username',
                              ),
                              subtitle: textParagraph(
                                data.message ?? '',
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: textParagraphBlack(
                                  dateChange(value
                                      .notificationData![index].createdAt
                                      .toString()),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dateChange(String date) {
    DateTime dateTime = DateTime.parse(date);
    // String formatteddate = DateFormat('dd-MMMM-yyyy', 'en_US').format(dateTime);
    String time = DateFormat('h:mm a').format(dateTime);
    return time;
  }
}
