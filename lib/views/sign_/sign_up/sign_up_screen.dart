import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/otp_provider/otp_provider.dart';
import 'package:foundr_project/controllers/provider/sign_up_provider/sign_up_provider.dart';

import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/views/sign_/sign_in/sign_in_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final providerWOL = Provider.of<SignUpProvider>(context, listen: false);
    final providerWOLOTP = Provider.of<OtpProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kYellow,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: SizedBox(
            height: 700,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/foundr_logo.png',
                  width: 150,
                ),
                kHeight20,
                Container(
                  height: size.height * 0.60,
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
                        Text('Register', style: kHeading),
                        Form(
                            key: formkey,
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller:
                                          providerWOLOTP.usernameController,
                                      validator: (value) =>
                                          providerWOL.userNameValidation(value),
                                      decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 3),
                                          prefixIcon: Icon(
                                              CupertinoIcons.person,
                                              color: kBrown),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          labelText: 'User Name'),
                                    ),
                                    kHeight10,
                                    TextFormField(
                                      controller:
                                          providerWOLOTP.emailController,
                                      onChanged: (newValue) {
                                        providerWOL
                                            .updateTextFormFieldValue(newValue);
                                      },
                                      validator: (value) =>
                                          providerWOL.emailValidation(value),
                                      decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 3),
                                          prefixIcon: Icon(CupertinoIcons.at,
                                              color: kBrown),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          labelText: 'Email'),
                                    ),
                                    kHeight10,
                                    TextFormField(
                                      controller:
                                          providerWOLOTP.passwordController,
                                      obscureText: true,
                                      validator: (value) =>
                                          providerWOL.passwordValidation(value),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 3),
                                        prefixIcon: Icon(CupertinoIcons.padlock,
                                            color: kBrown),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        labelText: 'Password',
                                      ),
                                    ),
                                    kHeight10,
                                    ElevatedButton(
                                      onPressed: () {
                                        final validate =
                                            formkey.currentState!.validate();
                                        if (!validate) {
                                          return;
                                        }
                                        providerWOL.verifyUserProvider(context);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 50),
                                        child: Text('Register'),
                                      ),
                                    ),
                                    kHeight10,
                                    const Divider(
                                      thickness: 3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Already have an account ?"),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignInScreen(),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Log in',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  ],
                                )))
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
