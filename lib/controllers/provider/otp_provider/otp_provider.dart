import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/model/api/sign_up/signup_request.dart';
import 'package:foundr_project/services/otp_services/otp_services.dart';
import 'package:foundr_project/services/sign_up_services/sign_up_services.dart';
import 'package:foundr_project/views/home_screen/home_screen.dart';

class OtpProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();

  Future<void> verifyotpProvider(BuildContext context) async {
    final otp = otpController.text;
    final email = emailController.text.trim();
    final userName = usernameController.text;
    final password = passwordController.text.trim();

    final signupUser = SignupReqModel(
      userName: userName,
      email: email,
      password: password,
    );

    ApiServiceOTP().verifyOTP(otp).then((value) => {
          if (value == true)
            {
              ScaffoldMessenger.of(context).showSnackBar(oTPvarified),
              ApiServiceSignUp().signUp(signupUser, context).then(
                    (value) => {
                      if (value?.token != null)
                        {
                          storage.write(key: "token", value: value!.token),
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false)
                        }
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(sWWrong),
                        }
                    },
                  ),
              disposeText()
            }
          else if (value == false)
            {
              ScaffoldMessenger.of(context).showSnackBar(incorrectOTP),
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(sWWrong),
            }
        });
  }

  void disposeText() {
    otpController.clear();
  }
}
