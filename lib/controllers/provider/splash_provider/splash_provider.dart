import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/controllers/provider/profile/profile_screen_provider.dart';
import 'package:foundr_project/controllers/provider/view_profile/view_profile_provider.dart';
import 'package:foundr_project/views/main_screens/home_screen/home_screen.dart';
import 'package:foundr_project/views/sign_/sign_in/sign_in_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class SplashScreenProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool? isExpired;
  String? nameUser;

  splashTimer(BuildContext context) async {
    String? checkLogin = await storage.read(key: "token");
    if (checkLogin != null) {
      log(checkLogin);
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
            MaterialPageRoute(builder: (context) => const HomeScreen()));

        Provider.of<ProfileScreenProvider>(context, listen: false)
            .getUserDetailsProvider();
        Provider.of<ViewProfileProvider>(context, listen: false)
            .getallConnectionReq();
        Provider.of<ViewProfileProvider>(context, listen: false)
            .getalltheConnections();
      }
    });
  }
}
