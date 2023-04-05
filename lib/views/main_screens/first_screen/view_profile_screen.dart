import 'package:flutter/material.dart';

import 'package:foundr_project/controllers/provider/matching_profile/matching_profile_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

import 'package:provider/provider.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextStyleWidget(
            title: 'View Profile',
            thick: FontWeight.bold,
            textcolor: Colors.white,
            fontsize: 22),
        backgroundColor: kYellow,
      ),
      backgroundColor: kCream,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:
            Consumer<MatchingProfileProvider>(builder: (context, data, child) {
          return Column(
            children: [
              kHeight10,
              Align(
                alignment: Alignment.center,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                      width: size.width * .90,
                      height: size.height * .33,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/user.png"),
                            ),
                            kHeight5,
                            TextStyleWidget(
                              title: 'user',
                              thick: FontWeight.w600,
                              textcolor: kBrown,
                              fontsize: 20,
                            ),
                            const TextStyleWidget(
                              title: 'Developer',
                              thick: FontWeight.w500,
                              textcolor: kGreen,
                              fontsize: 14,
                            ),
                            kHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(255, 32, 106, 167))),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.person_add,
                                        size: 16,
                                      ),
                                      kWidth10,
                                      const Text(
                                        'Connect',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                    width: size.width * .90,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textMiniHeading2('About'),
                          textParagraphBlack('Intro'),
                          kHeight5,
                          textMiniHeading2('Impressive Accomplishments'),
                          textParagraphBlack('Accomplishment'),
                          kHeight5,
                          textMiniHeading2('Education'),
                          textParagraphBlack('schools'),
                          kHeight5,
                          textMiniHeading2('Employment'),
                          textParagraphBlack('works'),
                          kHeight5,
                          rowBottomSheetAnswers('Is Technical', 'Nil'),
                          kHeight5,
                          rowBottomSheetAnswers('Has Idea', 'Nil'),
                          kHeight5,
                          rowBottomSheetAnswers('Interests', 'Nil'),
                          kHeight5,
                          rowBottomSheetAnswers('Responsiblities', 'Nil'),
                        ],
                      ),
                    )),
              ),
            ],
          );
        }),
      ),
    );
  }

  Row rowBottomSheetAnswers(String left, String right) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: textMiniHeading2(left),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
                color: kRoseCream, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(right),
            ),
          ),
        )
      ],
    );
  }
}
