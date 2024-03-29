import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/otp_provider/otp_provider.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/services/sign_up_services/sign_up_services.dart';
import 'package:foundr_project/views/sign_/otp/otp_screen.dart';
import 'package:provider/provider.dart';

class SignUpProvider with ChangeNotifier {
  bool isLoading = false;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> verifyUserProvider(BuildContext context) async {
    isLoading = true;
    final provider = Provider.of<OtpProvider>(context, listen: false);
    final email = provider.emailController.text;
    final userName = provider.usernameController.text;
    await ApiServiceSignUp()
        .verifyUserNGenerateService(email, context)
        .then((value) => {
              if (value == "Email Already Exists")
                {
                  ScaffoldMessenger.of(context).showSnackBar(emailExists),
                }
              else if (value != null)
                {
                  ApiServiceSignUp()
                      .sendMail(email, context, value, userName)
                      .then((value) => {
                            if (value == true)
                              {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OtpScreen(
                                      textFormFieldValue:
                                          textFormFieldValue.toString()),
                                )),
                                isLoading = false
                              }
                          })
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(sWWrong),
                }
            });
  }

  String? userNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    } else {
      return null;
    }
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

  //copying textfrom field to otp page
  String? textFormFieldValue;
  void updateTextFormFieldValue(String newValue) {
    textFormFieldValue = newValue;
    notifyListeners();
  }
}
