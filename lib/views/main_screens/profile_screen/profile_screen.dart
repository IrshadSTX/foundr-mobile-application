import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/profile_screen/widgets/fields_row_widget.dart';
import 'package:foundr_project/views/main_screens/profile_screen/widgets/text_field_widget.dart';
import 'package:foundr_project/views/splash_screen.dart';

import 'widgets/card_button_widget.dart';

class ProfieScreen extends StatelessWidget {
  const ProfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    FlutterSecureStorage storage = const FlutterSecureStorage();
    return Scaffold(
      backgroundColor: kCream,
      appBar: AppBar(
        backgroundColor: kYellow,
        title: const TextStyleWidget(
          title: 'Profile',
          thick: FontWeight.bold,
          textcolor: Colors.white,
          fontsize: 32,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Sign out!',
                      style: kHeading,
                    ),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text(
                            'Are you sure want to Sign Out',
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        child: const Text('Decline'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Yes',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          storage.delete(key: "token");
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const SplashScreen()),
                              (route) => false);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                const TextStyleWidget(
                  title: 'User',
                  thick: FontWeight.w700,
                  textcolor: kBrown,
                  fontsize: 24,
                ),
                const TextStyleWidget(
                  title: 'Flutter Dev/Operator',
                  thick: FontWeight.w400,
                  textcolor: kGreen,
                  fontsize: 14,
                ),
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardButtonWidget(
                      title: '4 Connections',
                      onPressed: () {},
                    ),
                    CardButtonWidget(
                      title: 'Messages',
                      onPressed: () {},
                    )
                  ],
                ),
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    TextStyleWidget(
                        title: 'User Profile',
                        thick: FontWeight.bold,
                        textcolor: kBrown,
                        fontsize: 18),
                  ],
                ),
                Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          kHeight10,
                          const TextFormWidget(
                            hinttext: 'About yourself',
                          ),
                          kHeight10,
                          FieldsInRowWidget(),
                          kHeight10,
                          Row(
                            children: [
                              const Expanded(
                                child: TextFormWidget(
                                  hinttext: 'state',
                                ),
                              ),
                              kWidth10,
                              const Expanded(
                                child: TextFormWidget(
                                  hinttext: 'city/Town',
                                ),
                              ),
                            ],
                          ),
                          kHeight10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                  onPressed: () {}, child: const Text('Save')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    kHeight10,
                    const TextStyleWidget(
                        title: 'More Details',
                        thick: FontWeight.bold,
                        textcolor: kBrown,
                        fontsize: 18),
                    kHeight10,
                    Row(
                      children: [
                        CardButtonWidget(
                          title: 'About Me',
                          onPressed: () {},
                        ),
                        kWidth10,
                        CardButtonWidget(
                          title: 'Co-Founder',
                          onPressed: () {},
                        )
                      ],
                    ),
                    kHeight5,
                    SizedBox(
                        width: size.width * 0.9,
                        child: const Text(
                          'Co-Founder Matches will be found according to the details provided in the About me and Co-Founder sections',
                          style: TextStyle(
                              color: kGreen,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
