import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';

class ApiServiceOTP {
  var dio = Dio();
  Future<bool?> verifyOTP(String code) async {
    log(code);
    String path = kBaseurl + ApiEndPoints.verifyOTP;
  }
}
