import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/splash_provider/splash_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashScreenProvider>(context, listen: false)
        .splashTimer(context);
    return const Scaffold(
      backgroundColor: kYellow,
      body: Center(
        child: Image(
          width: 250,
          image: AssetImage('assets/images/foundr_logo.png'),
        ),
      ),
    );
  }
}
