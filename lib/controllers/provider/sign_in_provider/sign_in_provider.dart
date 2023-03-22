import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/model/api/sign_in/signin_req.dart';
import 'package:foundr_project/services/sign_in/sign_in_service.dart';
import 'package:foundr_project/views/splash_screen.dart';
import '../../../views/main_screens/home_screen/home_screen.dart';

class SigninProvider with ChangeNotifier {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool isLoading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();
//value checking
  Future<void> signinCheck(BuildContext context) async {
    isLoading = true;
    final email = emailcontroller.text.trim();
    final password = passwordcontroller.text.trim();
    final signinuser = SigninreqModel(email: email, password: password);
    await ApiServiceSignIn().signIn(signinuser, context).then(
          (value) => {
            if (value?.token != null)
              {
                storage.write(key: "token", value: jsonEncode(value!.token)),
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                    (route) => false),
                disposeTextfield()
              }
          },
        );

    isLoading = false;
    notifyListeners();
  }

  void disposeTextfield() {
    emailcontroller.clear();
    passwordcontroller.clear();
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email, please enter correct email';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 5) {
      return 'password must have more than 5 charecters';
    } else {
      return null;
    }
  }
}
