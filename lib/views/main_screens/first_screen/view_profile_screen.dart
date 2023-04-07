import 'package:flutter/material.dart';

import 'package:foundr_project/controllers/provider/matching_profile/matching_profile_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

import 'package:provider/provider.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen(
      {super.key,
      required this.profileId,
      required this.profileImage,
      required this.userName,
      required this.location,
      required this.email,
      required this.about,
      required this.accomplishment,
      required this.education,
      required this.technical,
      required this.idea,
      required this.interests,
      required this.responsibilities,
      this.userId,
      required this.intro,
      required this.employment});
  final String employment;
  final String intro;
  final String profileId;
  final String profileImage;
  final String userName;
  final String location;
  final String email;
  final String about;
  final String accomplishment;
  final String education;
  final String technical;
  final String idea;
  final List<dynamic> interests;
  final List<dynamic> responsibilities;
  final String? userId;
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(profileImage != null
                                  ? profileImage
                                  : 'photo'),
                            ),
                            kHeight5,
                            TextStyleWidget(
                              title: userName != null ? userName : 'nil',
                              thick: FontWeight.w600,
                              textcolor: kBrown,
                              fontsize: 20,
                            ),
                            TextStyleWidget(
                              title: intro != null ? intro : 'nil',
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
                          textMiniHeading2('Email'),
                          textParagraphBlack(
                            email != null ? email : 'nil',
                          ),
                          kHeight5,
                          textMiniHeading2('Impressive Accomplishments'),
                          textParagraphBlack(
                            accomplishment != null ? accomplishment : 'nil',
                          ),
                          kHeight5,
                          textMiniHeading2('Education'),
                          textParagraphBlack(
                            education != null ? education : 'nil',
                          ),
                          kHeight5,
                          textMiniHeading2('Employment'),
                          textParagraphBlack(
                            employment != null ? employment : 'nil',
                          ),
                          kHeight5,
                          rowBottomSheetAnswers(
                            'Is Technical',
                            technical != null ? technical : 'nil',
                          ),
                          kHeight5,
                          rowBottomSheetAnswers(
                            'Has Idea',
                            idea != null ? idea : 'nil',
                          ),
                          kHeight5,
                          rowBottomSheetAnswers(
                              'Interests',
                              interests != null
                                  ? interests
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(']', '')
                                  : 'nil'),
                          kHeight5,
                          rowBottomSheetAnswers(
                              'Responsiblities',
                              responsibilities != null
                                  ? responsibilities
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(']', '')
                                  : 'nil'),
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
          flex: 3,
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
