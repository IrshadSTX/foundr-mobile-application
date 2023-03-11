import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/splash_screen.dart';

class ProfieScreen extends StatelessWidget {
  const ProfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return Scaffold(
        backgroundColor: kRoseCream,
        appBar: AppBar(
          backgroundColor: kYellow,
          title: const TextStyleWidget(
            title: 'Profile',
            thick: FontWeight.bold,
            textcolor: Colors.white,
            fontsize: 32,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 35,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await storage.delete(key: "token");
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()),
                        (route) => false);
                  },
                  child: const Text('Sign Out'))
            ],
          ),
        ));
  }
}
