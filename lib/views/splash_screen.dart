import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';

import 'sign_/sign_in/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kYellow,
      body: Container(
        child: const Center(
          child: Image(
            width: 250,
            image: AssetImage('assets/images/foundr_logo.png'),
          ),
        ),
      ),
    );
  }
}
