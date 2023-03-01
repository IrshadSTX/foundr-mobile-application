import 'package:flutter/material.dart';
import 'package:foundr_project/views/home_screen/home_screen.dart';
import 'package:foundr_project/core/colors.dart';

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
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
