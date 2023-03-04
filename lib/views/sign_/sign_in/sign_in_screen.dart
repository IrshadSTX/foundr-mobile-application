import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';

import '../sign_up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

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
                        Text('Login', style: kHeading),
                        kHeight10,
                        Form(
                            key: formkey,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: emailcontroller,
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
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 3),
                                      prefixIcon: Icon(CupertinoIcons.padlock,
                                          color: kBrown),
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Forgot password?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 50),
                                      child: Text('Login'),
                                    ),
                                  ),
                                  kHeight10,
                                  const Divider(
                                    thickness: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Don't have an account ? "),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen(),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Sign up',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
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
