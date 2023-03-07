import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/views/splash_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return Center(
      child: Column(
        children: [
          const Text('This is home page'),
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
    );
  }
}
