import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';
import 'package:foundr_project/model/api/sign_in/signin_req.dart';
import 'package:foundr_project/model/api/sign_in/signin_res.dart';
import 'package:foundr_project/utils/exceptions/exception.dart';

class ApiServiceSignIn {
  var dio = Dio();
  Future<SigninRespModel?> signIn(
      SigninreqModel model, BuildContext context) async {
    String path = kBaseurl + ApiEndPoints.signIn;
    try {
      Response response =
          await dio.post(path, data: jsonEncode(model.toJson()));
      log("after response from the sign in ");
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final SigninRespModel signinRespModel1 =
            SigninRespModel.fromJson(response.data);
        return signinRespModel1;
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e, context);
    }
    return null;
  }
}
