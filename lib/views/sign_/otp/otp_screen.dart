import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/otp_provider/otp_provider.dart';

import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.textFormFieldValue});
  final GlobalKey<FormState> formKey = GlobalKey();
  final String textFormFieldValue;

  @override
  Widget build(BuildContext context) {
    final providerWOL = Provider.of<OtpProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kYellow,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/foundr_logo.png',
                  width: 150,
                ),
                kHeight40,
                Container(
                  height: size.height * 0.50,
                  width: size.width * 0.92,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: kCream,
                    child: Column(
                      children: [
                        kHeight20,
                        Text('OTP', style: kHeading),
                        kHeight10,
                        Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    readOnly: true,
                                    controller: TextEditingController(
                                        text: textFormFieldValue),
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 3),
                                        prefixIcon: Icon(CupertinoIcons.at,
                                            color: kBrown),
                                        border: OutlineInputBorder(),
                                        labelText: 'Email'),
                                  ),
                                  kHeight20,
                                  TextFormField(
                                    controller: providerWOL.otpController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 3),
                                      prefixIcon: Icon(CupertinoIcons.padlock,
                                          color: kBrown),
                                      border: OutlineInputBorder(),
                                      labelText: 'otp',
                                    ),
                                  ),
                                  kHeight10,
                                  ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        providerWOL.verifyotpProvider(context);
                                      }
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 50),
                                      child: Text('Submit'),
                                    ),
                                  ),
                                  kHeight10,
                                  const Divider(
                                    thickness: 3,
                                  ),
                                  const Text(
                                      "The password has been sent to email!"),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
