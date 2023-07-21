import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:foundr_project/controllers/provider/matching_profile/matching_profile_provider.dart';
import 'package:foundr_project/controllers/provider/view_profile/view_profile_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/message_screen/chat_screen.dart';

import 'package:provider/provider.dart';

class ViewProfileScreen extends StatefulWidget {
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
  final String? employment;
  final String? intro;
  final String profileId;
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
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  void initState() {
    Provider.of<ViewProfileProvider>(context, listen: false)
        .getallConnectionReq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.profileImage!, name: 'profile image');
    log(widget.profileId.toString());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextStyleWidget(
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
                              child: widget.profileImage != 'null'
                                  ? CircleAvatar(
                                      radius: 50,
                                      backgroundImage: FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/user.png',
                                        image: widget.profileImage!,
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
                              title: widget.userName!,
                              thick: FontWeight.w600,
                              textcolor: kBrown,
                              fontsize: 20,
                            ),
                            TextStyleWidget(
                              title: widget.intro != 'null'
                                  ? widget.intro!
                                  : 'Nil',
                              thick: FontWeight.w500,
                              textcolor: kGreen,
                              fontsize: 14,
                            ),
                            kHeight10,
                            Consumer<ViewProfileProvider>(
                              builder: (context, value, child) {
                                if (value.connectionCheck == 'empty' ||
                                    value.connectionCheck == null) {
                                  return Align(
                                    alignment: Alignment.topRight,
                                    child: connectButtons(
                                      height1: 40,
                                      width1: 130,
                                      text: 'connect',
                                      icons: Icons.person_add_alt_sharp,
                                      onPress: () async {
                                        value.sendConnection(
                                            widget.profileId, context);
                                        await value
                                            .buttonFunction(widget.profileId);
                                      },
                                    ),
                                  );
                                } else {
                                  return Align(
                                    alignment: Alignment.topRight,
                                    child: value.connectionCheck == 'requested'
                                        ? connectButtons(
                                            color: Colors.black45,
                                            height1: 40,
                                            width1: 140,
                                            text: 'requested',
                                            icons: Icons.person_add_alt_sharp,
                                            onPress: () {},
                                          )
                                        : value.connectionCheck ==
                                                'acceptOrReject'
                                            ? SizedBox(
                                                width: size.width,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    connectButtons(
                                                      color: Colors.blue,
                                                      height1: 40,
                                                      width1: 120,
                                                      text: "Accept",
                                                      icons: Icons
                                                          .verified_outlined,
                                                      onPress: () {
                                                        value
                                                            .updateConnectionProvider(
                                                          "true",
                                                          widget.profileId,
                                                          context,
                                                        );
                                                      },
                                                    ),
                                                    connectButtons(
                                                      color: Colors.red,
                                                      height1: 40,
                                                      width1: 120,
                                                      text: "Reject",
                                                      icons: Icons.close,
                                                      onPress: () {
                                                        value
                                                            .updateConnectionProvider(
                                                          "false",
                                                          widget.profileId,
                                                          context,
                                                        );
                                                      },
                                                    )
                                                  ],
                                                ),
                                              )
                                            : connectButtons(
                                                height1: 40,
                                                color: kYellow,
                                                width1: 130,
                                                icons: Icons.chat_rounded,
                                                text: 'message',
                                                onPress: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MessagingUser(
                                                              profilePhoto: widget
                                                                  .profileImage,
                                                              userName: widget
                                                                  .userName,
                                                              selectedId: widget
                                                                  .profileId,
                                                              userId:
                                                                  widget.userId,
                                                            )),
                                                  );
                                                },
                                              ),
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textMiniHeading2('Email'),
                            textParagraphBlack(
                              widget.email!,
                            ),
                            divider,
                            kHeight5,
                            textMiniHeading2('Impressive Accomplishments'),
                            textParagraphBlack(
                              widget.accomplishment == null
                                  ? "not found"
                                  : widget.accomplishment!,
                            ),
                            divider,
                            kHeight5,
                            textMiniHeading2('Education'),
                            textParagraphBlack(
                              widget.education == null
                                  ? "not found"
                                  : widget.education!,
                            ),
                            divider,
                            kHeight5,
                            textMiniHeading2('Employment'),
                            textParagraphBlack(
                              widget.employment == null
                                  ? "not found"
                                  : widget.employment!,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            kHeight5,
                            rowBottomSheetAnswers(
                              'Is Technical',
                              widget.technical == null
                                  ? "not found"
                                  : widget.technical!,
                            ),
                            divider,
                            kHeight5,
                            rowBottomSheetAnswers(
                              'Has Idea',
                              widget.idea == null ? "not found" : widget.idea!,
                            ),
                            divider,
                            kHeight5,
                            rowBottomSheetAnswers(
                              'Interests',
                              widget.interests != null
                                  ? widget.interests
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(']', '')
                                  : 'nil',
                            ),
                            divider,
                            kHeight5,
                            rowBottomSheetAnswers(
                              'Responsibilities',
                              widget.responsibilities != null
                                  ? widget.responsibilities
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(']', '')
                                  : 'nil',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
