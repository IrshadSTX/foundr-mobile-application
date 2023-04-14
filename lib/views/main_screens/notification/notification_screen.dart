import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/view_profile/view_profile_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  String? userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kHeight10,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                child: Consumer<ViewProfileProvider>(
                  builder: (context, value, child) {
                    if (value.alltheConnection == null ||
                        value.alltheConnection!.isEmpty) {
                      return const Center(
                        child: Text(
                          "You dont have any connections",
                          style: textstyle,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.alltheConnection!.length,
                        itemBuilder: (context, index) {
                          final data = value.alltheConnection![index];
                          return Card(
                            color: kCream,
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
                                    backgroundImage: data.profilePhoto == null
                                        ? Image.asset('assets/images/user.png')
                                            .image
                                        : Image.network(data.profilePhoto!)
                                            .image),
                              ),
                              title: textMiniHeading2(
                                data.userName ?? 'username',
                              ),
                              subtitle: textParagraph(
                                data.location == null
                                    ? 'about'
                                    : '${data.intro}',
                              ),
                              onTap: () {},
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
}
