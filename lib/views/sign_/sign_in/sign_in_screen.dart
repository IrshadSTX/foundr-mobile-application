import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kYellow,
      body: SingleChildScrollView(
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
                  height: 400,
                  width: 350,
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
                            child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 3),
                                    prefixIcon:
                                        Icon(CupertinoIcons.at, color: kBrown),
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
                                      onPressed: () {},
                                      child: const Text(
                                        'Sign up',
                                        style: TextStyle(
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
