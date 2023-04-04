import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/controllers/provider/profile/profile_screen_provider.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/model/api/sign_up/signup_request.dart';
import 'package:foundr_project/services/otp_services/otp_services.dart';
import 'package:foundr_project/services/sign_up_services/sign_up_services.dart';
import 'package:foundr_project/views/splash_screen.dart';
import 'package:provider/provider.dart';

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
                          storage.write(
                              key: "token", value: jsonEncode(value!.token)),
                          Provider.of<ProfileScreenProvider>(context,
                                  listen: false)
                              .getUserDetailsProvider(),
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => SplashScreen(),
                              ),
                              (route) => false),
                          disposeTextfield(context)
                        }
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(sWWrong),
                        }
                    },
                  ),
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

  void disposeTextfield(context) {
    final provider = Provider.of<OtpProvider>(context, listen: false);
    provider.otpController.clear();
    provider.usernameController.clear();
    provider.emailController.clear();
    provider.passwordController.clear();
  }
}
