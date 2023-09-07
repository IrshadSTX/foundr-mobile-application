import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/services/sign_up_services/sign_up_services.dart';
import 'package:foundr_project/views/sign_/forgot/forgot_otp_screen.dart';
import 'package:foundr_project/views/sign_/otp/otp_screen.dart';
import 'package:provider/provider.dart';

import '../../../services/otp_services/otp_services.dart';
import '../otp_provider/otp_provider.dart';

class ForgotPWDProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

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

  Future<void> verifyotpProvider(BuildContext context) async {
    final otp = otpController.text;

    ApiServiceOTP().verifyOTP(otp).then((value) => {
          if (value == true)
            {
              ScaffoldMessenger.of(context).showSnackBar(oTPvarified),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotOTPScreen(
                            textFormFieldValue: emailController,
                          )))
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

  bool isLoading = false;
  Future<void> verifyUserProvider(BuildContext context) async {
    log('inside verifyUser');
    isLoading = true;
    // final provider = Provider.of<OtpProvider>(context, listen: false);
    final email = emailController.text;

    await ApiServiceSignUp()
        .verifyUserNGenerateService(email, context)
        .then((value) => {
              if (value == "Email Already Exists")
                {
                  ApiServiceSignUp()
                      .sendMail(email, context, email, email)
                      .then((value) => {
                            if (value == true)
                              {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OtpScreen(
                                      textFormFieldValue:
                                          emailController.toString()),
                                )),
                                isLoading = false
                              }
                          })
                }
              else if (value != null)
                {
                  ScaffoldMessenger.of(context).showSnackBar(emailExists),
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
