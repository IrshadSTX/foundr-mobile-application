import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/first_screen/widgets/card_details_widget.dart';
import 'package:foundr_project/views/main_screens/first_screen/widgets/match_found_list.dart';
import 'package:foundr_project/views/main_screens/first_screen/widgets/more_button.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kYellow,
        title: Image.asset('assets/images/foundr_logo.png', width: 150),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight30,
              const TextStyleWidget(
                title: 'Connecting Better.',
                thick: FontWeight.bold,
                textcolor: kBrown,
                fontsize: 24,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.55,
                    child: const TextStyleWidget(
                      title:
                          '''Connect with co-founders based on your preferences for interests, skills, location, and more, and start building your company.''',
                      thick: FontWeight.w400,
                      textcolor: kGreen,
                      fontsize: 12,
                    ),
                  ),
                  Expanded(
                      child: Image.asset(
                    'assets/images/community.png',
                  )),
                ],
              ),
              kHeight10,
              const TextStyleWidget(
                title: 'Match Found!',
                thick: FontWeight.bold,
                textcolor: kBrown,
                fontsize: 24,
              ),
              const TextStyleWidget(
                title: 'These profiles have some matches with your profile',
                thick: FontWeight.w400,
                textcolor: kGreen,
                fontsize: 12,
              ),
              kHeight10,
              const MatchingFoundLists(),
              const MoreButtonWidget(),
              kHeight10,
              SizedBox(
                height: 180,
                child:
                    ListView(scrollDirection: Axis.horizontal, children: const [
                  CardDetailsWidget(
                    title: 'Thousands of co-founders await',
                    subtitle:
                        "Join the largest co-founder matching platform to find the strongest candidate that’s right for you.",
                  ),
                  CardDetailsWidget(
                    title: 'Learn from experts',
                    subtitle:
                        "Learn from experts who have succeed in their industries and doing business.",
                  ),
                  CardDetailsWidget(
                    title: 'Participate in events',
                    subtitle:
                        "Participate in events that are conducting by leading industrial experts though online or offline.",
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
