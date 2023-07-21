import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/forgot_provider/forgot_provider.dart';
import 'package:foundr_project/views/sign_/forgot/forgot_otp_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';

class ForgotPWDScreen extends StatelessWidget {
  ForgotPWDScreen({super.key});
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kYellow,
        elevation: 0,
      ),
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
                kHeight30,
                Container(
                  height: size.height * 0.40,
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
                        Text('Forgot Password?', style: kHeading),
                        kHeight5,
                        const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Don't worry, Recover your Account by enter the registered email. We will send you an OTP to verify it's you.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, color: kGreen),
                            )),
                        Form(
                            key: formkey,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Consumer<ForgotPWDProvider>(
                                  builder: (context, provider, child) {
                                return Column(
                                  children: [
                                    TextFormField(
                                      controller: provider.emailController,
                                      validator: (value) =>
                                          provider.emailValidation(value),
                                      decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 3),
                                          prefixIcon: Icon(CupertinoIcons.at,
                                              color: kBrown),
                                          border: OutlineInputBorder(),
                                          labelText: 'Email'),
                                    ),
                                    kHeight10,
                                    ElevatedButton(
                                      onPressed: () {
                                        log('buttonpressed');
                                        if (formkey.currentState!.validate()) {
                                          return;
                                        }
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotOTPScreen(
                                                        email: provider
                                                            .emailController)));

                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 50),
                                        child: Text('Send OTP'),
                                      ),
                                    ),
                                    kHeight10,
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
  void clearTextfield(){
    
  }
}
