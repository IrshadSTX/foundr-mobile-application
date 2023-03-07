import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/sign_up_provider/sign_up_provider.dart';

import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/views/sign_/sign_in/sign_in_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                kHeight40,
                Container(
                  height: size.height * 0.52,
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
                        kHeight10,
                        Form(
                            child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 3),
                                    prefixIcon: Icon(CupertinoIcons.person,
                                        color: kBrown),
                                    border: OutlineInputBorder(),
                                    labelText: 'User Name'),
                              ),
                              kHeight10,
                              TextFormField(
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 3),
                                    prefixIcon:
                                        Icon(CupertinoIcons.at, color: kBrown),
                                    border: OutlineInputBorder(),
                                    labelText: 'Email'),
                              ),
                              kHeight10,
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
                              kHeight10,
                              ElevatedButton(
                                onPressed: () {},
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
