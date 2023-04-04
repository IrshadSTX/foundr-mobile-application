import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/matching_profile/matching_profile_provider.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:provider/provider.dart';

class MatchingFoundLists extends StatelessWidget {
  const MatchingFoundLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
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
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                color: Colors.blueAccent,
                              )),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextStyleWidget(
                              title: 'Connect',
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
          itemCount: 5,
        );
      }),
    );
  }
}
