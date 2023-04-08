import 'package:flutter/material.dart';

import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/views/main_screens/first_screen/view_profile_screen.dart';

import 'package:provider/provider.dart';

import '../../../../controllers/provider/matching_profile/matching_profile_provider.dart';
import '../../../../core/widgets/textstyle.dart';

class MoreMatchingScreen extends StatelessWidget {
  const MoreMatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MatchingProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextStyleWidget(
            title: '${provider.matchingProfileDatas!.length}-Matches Found!',
            thick: FontWeight.bold,
            textcolor: Colors.white,
            fontsize: 22),
        backgroundColor: kYellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          child: Consumer<MatchingProfileProvider>(
              builder: (context, data, child) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0),
              itemBuilder: (context, index) {
                var value = data.matchingProfileDatas![index];
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                      width: 160,
                      child: Column(
                        children: [
                          data.matchingProfileDatas![index].profilePhoto != null
                              ? Expanded(
                                  child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/user.png',
                                        image: data.matchingProfileDatas![index]
                                            .profilePhoto!,
                                        fit: BoxFit.fill,
                                        fadeInDuration:
                                            const Duration(milliseconds: 500),
                                      ).image),
                                )
                              : const CircleAvatar(
                                  radius: 42,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage("assets/images/user.png"),
                                ),
                          TextStyleWidget(
                            title: data.matchingProfileDatas![index].userName!,
                            thick: FontWeight.w500,
                            textcolor: Colors.black,
                            fontsize: 14,
                          ),
                          TextStyleWidget(
                            title:
                                data.matchingProfileDatas![index].intro != null
                                    ? data.matchingProfileDatas![index].intro!
                                    : 'Nil',
                            thick: FontWeight.w400,
                            textcolor: kGreen,
                            fontsize: 12,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewProfileScreen(
                                            profileImage:
                                                value.profilePhoto ?? 'null',
                                            profileId: value.id ?? '',
                                            userName: value.userName ?? '',
                                            location:
                                                '${value.location!.country ?? ''},${value.location!.city ?? ''}',
                                            email: value.email ?? '',
                                            about: value.userName ?? '',
                                            accomplishment:
                                                value.accomplishments ?? '',
                                            education: value.education ?? '',
                                            technical: value.isTechnical == 1
                                                ? 'Yes'
                                                : 'no',
                                            idea: value.haveIdea ==
                                                    'definiteIdea'
                                                ? 'Yes'
                                                : value.haveIdea ==
                                                        'readyToExplore'
                                                    ? 'No'
                                                    : 'don\'t have any idea',
                                            interests: value.interests!,
                                            responsibilities:
                                                value.responsibilities!,
                                            intro: value.intro!,
                                            employment: value.employment!,
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Colors.black38,
                                  )),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: TextStyleWidget(
                                  title: 'View Profile',
                                  thick: FontWeight.w600,
                                  textcolor: Colors.blueAccent,
                                  fontsize: 14,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                );
              },
              itemCount: data.matchingProfileDatas!.length,
            );
          }),
        ),
      ),
    );
  }
}
