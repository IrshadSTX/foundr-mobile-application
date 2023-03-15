import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';
import 'package:foundr_project/model/api/sign_up/signup_request.dart';
import 'package:foundr_project/model/api/sign_up/signup_response.dart';
import 'package:foundr_project/utils/exceptions/exception.dart';

class ApiServiceSignUp {
  final dio = Dio();

  //verify the user , if not registered then generating otp
  Future<String?> verifyUserNGenerateService(
      String email, BuildContext context) async {
    String path = kBaseurl + ApiEndPoints.verifyUser;

    try {
      Response response = await dio.get(
        path,
        queryParameters: {"email": email},
        options: Options(
          validateStatus: (status) => status! < 500,
        ),
      );
      if (response.statusCode == 400) {
        return 'Email Already Exists';
      } else if (response.statusCode == 201) {
        return response.data.toString();
      }
    } on DioException catch (e) {
      DioException().dioError(e, context);
    }
    return null;
  }

  //sending the otp to the given mail
  Future<bool?> sendMail(
      String email, BuildContext context, String code, String userName) async {
    String path = kBaseurl + ApiEndPoints.sendMail;
    try {
      Response response = await dio.post(
        path,
        data: {
          "email": email,
          "content": "OTP for Email Varification is $code",
          "userName": userName,
        },
      );

      log("response from send mail :${response.data}");
      if (response.statusCode == 201) {
        //message sent successfully
        return true;
      } else {
        //message not successful
        return false;
      }
    } on DioError catch (e) {
      DioException().dioError(e, context);
    }
    return null;
  }

//collecting datas using model and signup
  Future<SignupResModel?> signUp(
      SignupReqModel model, BuildContext context) async {
    String path = kBaseurl + ApiEndPoints.signUp;
    try {
      Response response = await dio.post(path, data: jsonEncode(model.toJson()),
          options: Options(
        validateStatus: (status) {
          return status! < 599;
        },
      ));
      log("after response from signup");
      if (response.statusCode == 201) {
        log(response.statusCode.toString());
        final SignupResModel signupmodel =
            SignupResModel.fromJson(response.data);
        return signupmodel;
      } else {
        log(response.data.toString());
        log(response.statusCode.toString());
      }
    } on DioError catch (e) {
      log("error part in sign up");
      DioException().dioError(e, context);
    }
    return null;
  }
}
