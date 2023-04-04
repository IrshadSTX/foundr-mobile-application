import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/controllers/provider/bottom_navigation.dart/bottom_navigation.dart';
import 'package:foundr_project/controllers/provider/profile/profile_screen_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/profile_screen/widgets/bottom_buttons_widgets.dart';
import 'package:foundr_project/views/main_screens/profile_screen/widgets/text_field_widget.dart';
import 'package:foundr_project/views/splash_screen.dart';
import 'package:provider/provider.dart';

import 'widgets/card_button_widget.dart';

class ProfieScreen extends StatelessWidget {
  ProfieScreen({super.key});

  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileScreenProvider>(context, listen: false);

    provider.genderController =
        TextEditingController(text: provider.profileDatas!.gender ?? '');
    provider.ageController = TextEditingController(
        text: provider.profileDatas!.age != null
            ? provider.profileDatas!.age.toString()
            : '');

    provider.aboutController =
        TextEditingController(text: provider.profileDatas!.intro ?? '');
    provider.nationController = TextEditingController(
        text: provider.profileDatas != null &&
                provider.profileDatas!.location != null
            ? provider.profileDatas!.location!.country
            : "");
    provider.stateController = TextEditingController(
        text: provider.profileDatas != null &&
                provider.profileDatas!.location != null
            ? provider.profileDatas!.location!.state
            : "");
    provider.cityController = TextEditingController(
        text: provider.profileDatas != null &&
                provider.profileDatas!.location != null
            ? provider.profileDatas!.location!.city
            : "");
    // //----------------//
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
            child: Consumer<ProfileScreenProvider>(
                builder: (context, data, child) {
              return data.profileDatas != null
                  ? Column(
                      children: [
                        InkWell(
                          onTap: () {
                            data.pickImage(context);
                          },
                          child: data.profileDatas != null &&
                                  data.profileDatas!.profilePhoto != null
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/user.png',
                                    image: data.profileDatas!.profilePhoto!,
                                  ).image)
                              : const CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage('assets/images/user.png'),
                                ),
                        ),
                        TextStyleWidget(
                          title: data.profileDatas!.userName!,
                          thick: FontWeight.w700,
                          textcolor: kBrown,
                          fontsize: 24,
                        ),
                        TextStyleWidget(
                          title: data.profileDatas!.email!,
                          thick: FontWeight.w400,
                          textcolor: kGreen,
                          fontsize: 14,
                        ),
                        kHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardButtonWidget(
                              navigate: null,
                              title: 'Connections',
                            ),
                            CardButtonWidget(
                              navigate: null,
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
                        //
                        //textformfields start here
                        //
                        Column(
                          children: [
                            Consumer<ProfileScreenProvider>(
                                builder: (context, value, child) {
                              return Form(
                                key: formkey,
                                child: Column(
                                  children: [
                                    kHeight10,
                                    TextFormWidget(
                                      controller: value.aboutController,
                                      hinttext: 'About yourself',
                                      validator: (data) =>
                                          value.checkingEmpty(data),
                                    ),
                                    kHeight10,
                                    Row(
                                      children: [
                                        Expanded(
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                                hintText: 'Gender',
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white),
                                            isExpanded: true,
                                            items: data.dropBoxItems
                                                .map((String dropdownVal) {
                                              return DropdownMenuItem<String>(
                                                value: dropdownVal,
                                                child: Text(
                                                  dropdownVal,
                                                  style: textstyle,
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              data.onChangeGender(value!);
                                            },
                                            validator: (value) =>
                                                data.onChangeGender(value!),
                                            value: data.profileDatas!.gender,
                                            style: textstyle,
                                          ),
                                        ),
                                        kWidth10,
                                        Expanded(
                                          child: TextFormWidget(
                                            controller: value.ageController,
                                            hinttext: 'Age',
                                            validator: (data) =>
                                                value.ageValidation(data),
                                          ),
                                        ),
                                        kWidth10, // Add some space between text fields
                                        Expanded(
                                          child: TextFormWidget(
                                            controller: value.nationController,
                                            hinttext: 'Nation',
                                            validator: (data) =>
                                                value.checkingEmpty(data),
                                          ),
                                        ),
                                      ],
                                    ),
                                    kHeight10,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormWidget(
                                            controller: value.stateController,
                                            hinttext: 'state',
                                            validator: (data) =>
                                                value.checkingEmpty(data),
                                          ),
                                        ),
                                        kWidth10,
                                        Expanded(
                                          child: TextFormWidget(
                                            controller: value.cityController,
                                            hinttext: 'city/Town',
                                            validator: (data) =>
                                                value.checkingEmpty(data),
                                          ),
                                        ),
                                      ],
                                    ),
                                    kHeight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                data.updateAboutProvider(
                                                    context);
                                              }
                                            },
                                            child: const Text('Save')),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                              //
                              //Textform fields end here
                              //
                            }),
                            BottomButtonsWidget(size: size)
                          ],
                        ),
                      ],
                    )
                  : const Center(
                      child: TextStyleWidget(
                          title: 'Network lost',
                          thick: FontWeight.bold,
                          textcolor: kRose,
                          fontsize: 26),
                    );
            }),
          ),
        ),
      ),
    );
  }
}
