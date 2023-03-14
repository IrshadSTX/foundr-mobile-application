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
              storage.delete(key: "token");
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                  (route) => false);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                  children: const [
                    CardButtonWidget(
                      title: '4 Connections',
                    ),
                    CardButtonWidget(
                      title: 'Messages',
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
                Form(
                  child: Column(
                    children: [
                      kHeight10,
                      TextFormWidget(
                        hinttext: 'About yourself',
                      ),
                      kHeight10,
                      FieldsInRowWidget()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
