import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/matching_profile/matching_profile_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/first_screen/view_profile_screen.dart';
import 'package:foundr_project/views/main_screens/first_screen/widgets/more_matches_screen.dart';
import 'package:provider/provider.dart';

class MatchingFoundLists extends StatelessWidget {
  const MatchingFoundLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Consumer<MatchingProfileProvider>(builder: (context, data, child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
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
                              radius: 50,
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
                        title: data.matchingProfileDatas![index].intro != null
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
                                  builder: (context) => ViewProfileScreen()));
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
          itemCount: 5,
        );
      }),
    );
  }
}
