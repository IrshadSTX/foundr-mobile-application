import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/profile/profile_screen_provider.dart';

import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';

import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/profile_screen/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextStyleWidget(
            title: 'About Me',
            thick: FontWeight.bold,
            textcolor: Colors.white,
            fontsize: 22),
        backgroundColor: kYellow,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: size.width * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textMiniHeading('Are you Technical?'),
                textParagraph(
                    'You are a programmer, Scientist or engineer who can build the product without outside assistance.'),
                kHeight10,
                ToggleSwitch(
                  minHeight: 25.0,
                  minWidth: 45.0,
                  initialLabelIndex: 1,
                  cornerRadius: 10.0,
                  activeFgColor: kBrown,
                  inactiveBgColor: kCream,
                  inactiveFgColor: kBrown,
                  totalSwitches: 2,
                  labels: const ['Yes', 'No'],
                  activeBgColors: const [
                    [kYellow],
                    [kRoseCream]
                  ],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
                divider,
                textMiniHeading(
                    "Do you already have startup or idea that you're set on?"),
                kHeight5,
                questionAir(
                  "1)",
                  "yes, I’m committed to an idea and i want a co-founder who can help buiit.",
                ),
                kHeight5,
                questionAir(
                  "2)",
                  "I have some ideas, but I’m also open to exploring other ideas.",
                ),
                kHeight5,
                questionAir(
                  "3)",
                  "No, I could help a co-founder with their existing idea or explore new ideas together.",
                ),
                kHeight10,
                Row(
                  children: [
                    ToggleSwitch(
                      minHeight: 30.0,
                      minWidth: size.width,
                      initialLabelIndex: 1,
                      cornerRadius: 10.0,
                      activeFgColor: kBrown,
                      inactiveBgColor: kCream,
                      inactiveFgColor: kBrown,
                      totalSwitches: 3,
                      labels: const ['1', '2', '3'],
                      activeBgColors: const [
                        [kYellow],
                        [kYellow],
                        [kYellow],
                      ],
                      onToggle: (index) {
                        log('switched to 2nd Question about me: $index');
                      },
                    ),
                  ],
                ),
                divider,
                textMiniHeading(
                  "Impressive accomplishment",
                ),
                textParagraph(
                  "write about your great accomplishment so far",
                ),
                kHeight5,
                TextFormWidget(
                  
                ),
                const Divider(),
                textMiniHeading('Education'),
                textParagraph(
                  "schools, degrees including field of study, and years of graduation. Use a separate line for each school.",
                ),
                kHeight5,
                TextFormWidget(),
                divider,
                textMiniHeading(
                  "Which areas of a startup are you willing to take responsibility for?",
                ),
                Consumer<ProfileScreenProvider>(
                    builder: (context, data, child) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: kBrown),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.responseFounderSelected!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kRoseCream,
                            border: Border.all(color: kBrown),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            data.responseFounderSelected![index],
                            style: const TextStyle(fontSize: 13),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 5),
                    ),
                  );
                }),
                kHeight10,
                Consumer<ProfileScreenProvider>(
                    builder: (context, data, child) {
                  return DropdownButtonFormField(
                    decoration: data.fieldDecor(),
                    // hint: Text("select"),
                    items: data.responseFounderitems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(fontSize: 13),
                        ),
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      data.onchangeResponseFounder(newvalue!);
                    },
                    value: data.respFounder,
                  );
                }),
                divider,
                textMiniHeading(
                    'Which topics and industries are interested in?'),
                textParagraph(
                    "We’ll try to show you more profiles from founders with common interests."),
                kHeight5,
                Consumer<ProfileScreenProvider>(
                    builder: (context, data, child) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: kBrown),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.interestedSelected.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kRoseCream,
                            border: Border.all(color: kBrown),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            data.interestedSelected[index]!,
                            style: const TextStyle(fontSize: 13),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 5),
                    ),
                  );
                }),
                kHeight10,
                Consumer<ProfileScreenProvider>(
                    builder: (context, data, child) {
                  return DropdownButtonFormField(
                    decoration: data.fieldDecor(),
                    // hint: Text("select"),
                    items: data.interestedItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(fontSize: 13),
                        ),
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      data.onchangeInterestedFounder(newvalue!);
                    },
                    value: data.respFounder,
                  );
                }),
                kHeight10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('save'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
