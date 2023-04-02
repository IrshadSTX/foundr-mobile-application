import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/profile/profile_screen_provider.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../core/colors.dart';
import '../../../../core/widgets/textstyle.dart';

class CoFounderScreen extends StatelessWidget {
  CoFounderScreen({super.key});
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextStyleWidget(
            title: 'Co-Founder',
            thick: FontWeight.bold,
            textcolor: Colors.white,
            fontsize: 22),
        backgroundColor: kYellow,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Consumer<ProfileScreenProvider>(builder: (context, data, child) {
            return Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textMiniHeading('Are you actively seeking a co-founder?'),
                  textParagraph(
                      'we can help you find others interested in finding a co-founder'),
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
                    labels: const ['No', 'Yes'],
                    activeBgColors: const [
                      [kRoseCream],
                      [kYellow],
                    ],
                    onToggle: (index) {
                      data.areYouSeeking = index!;
                      log('yes or no CO-FOUNDER ${data.areYouSeeking}');
                    },
                  ),
                  divider,

                  //**************TECHNICAL OR NON TECHNICAL DROPDOWN*************/

                  textMiniHeading(
                      'Do you prefer either technical or non-technical profiles?'),
                  kHeight10,
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        hintText: 'Select one',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                    isExpanded: true,
                    items: data.techOrNonTechItems.map((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(
                          val,
                          style: textstyle2,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      data.onChangeTechOrNonTech(value!);
                    },
                    value: data.techOrNonTechSelected,
                    validator: (value) => data.onChangeTechOrNonTech(value!),
                  ),
                  divider,

                  //**************HAVE IDEA?? DROPDOWN*************/
                  textMiniHeading(
                      'Are you looking for a co-founder who already has a specific idea, or are you open to exploring new ideas together?'),
                  kHeight10,
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        hintText: 'Select one',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                    isExpanded: true,
                    items: data.ideaHaveItems.map((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(
                          val,
                          style: textstyle2,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      data.onChangeIdeaHave(value!);
                    },
                    // validator: (value) => data.onChangeTechOrNonTech(value!),
                    // value: data.profileDatas!.gender,
                    // style: textstyle,
                  ),
                  divider,
                  //**************HAVE IDEA?? DROPDOWN*************/
                  textMiniHeading('Do you have a location preference?'),
                  kHeight10,
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'Select one',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    isExpanded: true,
                    items: data.locationPrefItems.map((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(
                          val,
                          style: textstyle2,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      data.onChangeLocationPref(value!);
                    },
                    // validator: (value) => data.onChangeTechOrNonTech(value!),
                    // value: data.profileDatas!.gender,
                    // style: textstyle,
                  ),
                  divider,

                  //**************AREAS OF RESPONSIBILITY DROP DOWN & CREATING CONTAINER*************/
                  textMiniHeading(
                      'Which areas would you like a co-founder to take responsibility for?'),
                  kHeight10,
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: kBrown),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.areaOfResponsibilitySelected.length,
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
                            data.areaOfResponsibilitySelected[index]!,
                            style: const TextStyle(fontSize: 13),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 5),
                    ),
                  ),
                  kHeight5,
                  DropdownButtonFormField(
                    decoration: data.fieldDecor(),
                    // hint: Text("select"),
                    items: data.areaOfResponsibilityitems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(fontSize: 13),
                        ),
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      data.onChangeAreaOfResponsibility(newvalue!);
                    },
                    value: data.areaOfResponsibility,
                  ),
                  kHeight10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              data.updateCoFounderProvider(context);
                            }
                          },
                          child: const Text('Save'))
                    ],
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
