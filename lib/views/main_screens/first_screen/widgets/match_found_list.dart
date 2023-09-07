import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/matching_profile/matching_profile_provider.dart';
import 'package:foundr_project/controllers/provider/view_profile/view_profile_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/first_screen/view_profile_screen.dart';
import 'package:foundr_project/views/widgets/shimmer_effect.dart';
import 'package:provider/provider.dart';

class MatchingFoundLists extends StatelessWidget {
  const MatchingFoundLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ViewProfileProvider>(context, listen: false);
    Provider.of<MatchingProfileProvider>(context).getAllMatchingProfiles();
    return SizedBox(
      height: 200,
      child: Consumer<MatchingProfileProvider>(builder: (context, data, child) {
        if (data.matchingProfileDatas == null) {
          return const Center(child: ShimmerLoadingMatchFound());
        } else if (data.matchingProfileDatas!.isEmpty) {
          return const Center(child: Text('No matches found!!'));
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var value = data.matchingProfileDatas![index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                    padding: const EdgeInsets.all(7),
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
                                radius: 53,
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
                        // TextStyleWidget(
                        //   title: data.matchingProfileDatas![index].intro != null
                        //       ? data.matchingProfileDatas![index].intro!
                        //       : 'Nil',
                        //   thick: FontWeight.w400,
                        //   textcolor: kGreen,
                        //   fontsize: 12,
                        // ),
                        TextButton(
                          onPressed: () async {
                            List notFound = ['not found'];

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewProfileScreen(
                                          profileImage:
                                              value.profilePhoto ?? 'null',
                                          profileId: value.id!,
                                          userName: value.userName!,
                                          location: value.location == null
                                              ? 'not found'
                                              : '${value.location!.country!},${value.location!.city!}',
                                          email: value.email!,
                                          about: value.userName!,
                                          accomplishment:
                                              value.accomplishments ?? 'null',
                                          education:
                                              value.education ?? "not found",
                                          technical: value.isTechnical == 1
                                              ? 'Yes'
                                              : 'no',
                                          idea: value.haveIdea == 'definiteIdea'
                                              ? 'Yes'
                                              : value.haveIdea ==
                                                      'readyToExplore'
                                                  ? 'No'
                                                  : 'don\'t have any idea',
                                          interests:
                                              value.interests ?? notFound,
                                          responsibilities:
                                              value.responsibilities ??
                                                  notFound,
                                          intro: value.intro ?? 'null',
                                          employment:
                                              value.employment ?? 'null',
                                        )));
                            await provider.buttonFunction(value.id!);
                            await provider.getallConnectionReq();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: Colors.black38,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextStyleWidget(
                                title: 'View Profile',
                                thick: FontWeight.w600,
                                textcolor: Color.fromARGB(255, 91, 165, 226),
                                fontsize: 14,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              );
            },
            itemCount: data.matchingProfileDatas!.length < 5
                ? data.matchingProfileDatas!.length
                : 5,
          );
        }
      }),
    );
  }
}
