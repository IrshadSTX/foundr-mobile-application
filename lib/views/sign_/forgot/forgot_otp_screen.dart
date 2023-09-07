import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/forgot_provider/forgot_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';

class ForgotOTPScreen extends StatelessWidget {
  ForgotOTPScreen({
    super.key,
    required this.textFormFieldValue,
  });

  final TextEditingController textFormFieldValue;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                            key: formkey,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Consumer<ForgotPWDProvider>(
                                  builder: (context, provider, child) {
                                return Column(
                                  children: [
                                    TextFormField(
                                      readOnly: true,
                                      controller: TextEditingController(
                                          text: textFormFieldValue.text),
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
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
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
                                        // if (formKey.currentState!.validate()) {
                                        //   providerWOL.verifyotpProvider(context);
                                        // }
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
                                );
                              }),
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
