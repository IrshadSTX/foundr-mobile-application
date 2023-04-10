import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:foundr_project/controllers/provider/matching_profile/matching_profile_provider.dart';
import 'package:foundr_project/controllers/provider/view_profile/view_profile_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

import 'package:provider/provider.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen(
      {super.key,
      this.profileId,
      this.profileImage,
      this.userName,
      this.location,
      this.email,
      this.about,
      this.accomplishment,
      this.education,
      this.technical,
      this.idea,
      this.interests,
      this.responsibilities,
      this.userId,
      this.intro,
      this.employment});
  final String? employment;
  final String? intro;
  final String? profileId;
  final String? profileImage;
  final String? userName;
  final String? location;
  final String? email;
  final String? about;
  final String? accomplishment;
  final String? education;
  final String? technical;
  final String? idea;
  final List<dynamic>? interests;
  final List<dynamic>? responsibilities;
  final String? userId;
  @override
  Widget build(BuildContext context) {
    log(profileImage!, name: 'profile image');
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
                              radius: 50,
                              child: profileImage != 'null'
                                  ? CircleAvatar(
                                      radius: 50,
                                      backgroundImage: FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/user.png',
                                        image: profileImage!,
                                        fit: BoxFit.fill,
                                        fadeInDuration:
                                            const Duration(milliseconds: 500),
                                      ).image)
                                  : const CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          AssetImage("assets/images/user.png"),
                                    ),
                            ),
                            kHeight5,
                            TextStyleWidget(
                              title: userName!,
                              thick: FontWeight.w600,
                              textcolor: kBrown,
                              fontsize: 20,
                            ),
                            TextStyleWidget(
                              title: intro!,
                              thick: FontWeight.w500,
                              textcolor: kGreen,
                              fontsize: 14,
                            ),
                            kHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Consumer<ViewProfileProvider>(
                                    builder: (context, data, child) {
                                  return ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      255, 32, 106, 167))),
                                      onPressed: () {
                                        Provider.of<ViewProfileProvider>(
                                                listen: false, context)
                                            .onClickedConnect();
                                      },
                                      child: Provider.of<ViewProfileProvider>(
                                                      listen: false, context)
                                                  .clickedConnect ==
                                              false
                                          ? Row(
                                              children: [
                                                const Icon(
                                                  Icons.person_add,
                                                  size: 16,
                                                ),
                                                kWidth10,
                                                const Text(
                                                  'Connect',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                const Icon(
                                                  Icons.person_add,
                                                  size: 16,
                                                ),
                                                kWidth10,
                                                const Text(
                                                  'Requested',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                              ],
                                            ));
                                })
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
                            email!,
                          ),
                          divider,
                          kHeight5,
                          textMiniHeading2('Impressive Accomplishments'),
                          textParagraphBlack(
                            accomplishment!,
                          ),
                          divider,
                          kHeight5,
                          textMiniHeading2('Education'),
                          textParagraphBlack(
                            education!,
                          ),
                          divider,
                          kHeight5,
                          textMiniHeading2('Employment'),
                          textParagraphBlack(
                            employment!,
                          ),
                          divider,
                          kHeight5,
                          rowBottomSheetAnswers(
                            'Is Technical',
                            technical!,
                          ),
                          divider,
                          kHeight5,
                          rowBottomSheetAnswers(
                            'Has Idea',
                            idea!,
                          ),
                          divider,
                          kHeight5,
                          rowBottomSheetAnswers(
                              'Interests',
                              interests != null
                                  ? interests
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(']', '')
                                  : 'nil'),
                          divider,
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
