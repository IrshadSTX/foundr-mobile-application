import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';

class ApiServiceOTP {
  var dio = Dio();
  Future<bool?> verifyOTP(String code) async {
    log(code);
    String path = kBaseurl + ApiEndPoints.verifyOTP;
    try {
      Response response = await dio.post(
        path,
        data: {"code": code},
        options: Options(
          validateStatus: (status) {
            return status! < 599;
          },
        ),
      );
      log("after response from verify otp");
      if (response.statusCode == 200) {
        log(response.data.toString());
        return true;
      } else {
        log(response.statusCode.toString());
        return false;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
