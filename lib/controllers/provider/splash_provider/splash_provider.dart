import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/views/home_screen/home_screen.dart';
import 'package:foundr_project/views/sign_/sign_in/sign_in_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashScreenProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool? isExpired;
  String? nameUser;

  splashTimer(BuildContext context) async {
    String? checkLogin = await storage.read(key: "token");
    if (checkLogin != null) {
      isExpired = JwtDecoder.isExpired(checkLogin.toString());
      notifyListeners();

      Map<String, dynamic> decodedtoken =
          JwtDecoder.decode(checkLogin.toString());
      nameUser = decodedtoken["userName"];
      notifyListeners();
    }

    Timer(const Duration(seconds: 3), () {
      if (checkLogin == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignInScreen()));
      } else if (isExpired == true) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignInScreen()));
      } else if (isExpired == false) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }
}
