import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/controllers/provider/view_profile/view_profile_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/first_screen/view_profile_screen.dart';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ConnectionScreen extends StatelessWidget {
  ConnectionScreen({super.key});
  String? userId;
  @override
  Widget build(BuildContext context) {
    getId();
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.white),
          toolbarHeight: 70,
          backgroundColor: kYellow,
          title: TextStyleWidget(
              title:
                  'Connections (${Provider.of<ViewProfileProvider>(context).alltheConnection!.length})',
              thick: FontWeight.bold,
              textcolor: Colors.white,
              fontsize: 20)),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kHeight10,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                child: Consumer<ViewProfileProvider>(
                  builder: (context, value, child) {
                    if (value.alltheConnection == null ||
                        value.alltheConnection!.isEmpty) {
                      return const Center(
                        child: Text(
                          "You dont have any connections",
                          style: textstyle,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.alltheConnection!.length,
                        itemBuilder: (context, index) {
                          final data = value.alltheConnection![index];
                          return Card(
                            color: kCream,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: data.profilePhoto == null
                                        ? Image.asset(
                                                'assets/images/event-image.png')
                                            .image
                                        : Image.network(data.profilePhoto!)
                                            .image),
                              ),
                              title: textMiniHeading2(
                                data.userName ?? 'username',
                              ),
                              subtitle: textParagraph(
                                data.location == null
                                    ? 'about'
                                    : '${data.intro}',
                              ),
                              trailing: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('ViewProfile'))),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewProfileScreen(
                                          intro: data.intro,
                                          employment: data.employment,
                                          profileId: data.id!,
                                          userName: data.userName!,
                                          location:
                                              "${data.location!.country!}, ${data.location!.state!}",
                                          email: data.email!,
                                          about: data.intro!,
                                          accomplishment: data.accomplishments!,
                                          education: data.education!,
                                          technical: data.isTechnical == 1
                                              ? 'yes'
                                              : 'no',
                                          idea: data.haveIdea == 'definiteIdea'
                                              ? 'Yes'
                                              : data.haveIdea ==
                                                      'readyToExplore'
                                                  ? 'No'
                                                  : 'don\'t have any idea',
                                          interests: data.interests!,
                                          responsibilities:
                                              data.responsibilities!,
                                          profileImage:
                                              data.profilePhoto ?? 'null',
                                          userId: userId,
                                        )));
                                value.buttonFunction(data.id!);
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getId() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();

    String? checkLogin = await storage.read(key: "token");
    Map<String, dynamic> decodedtoken =
        JwtDecoder.decode(checkLogin.toString());
    final idUser = decodedtoken["userId"];
    userId = idUser;
  }
}
