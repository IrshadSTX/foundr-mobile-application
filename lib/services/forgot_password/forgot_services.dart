import 'package:dio/dio.dart';

import '../../core/api/api_config.dart';
import '../../core/api/end_points.dart';

class ForgotServices {
  Future<void> forgotApiServices(String email) async {
    Dio dio = Dio();
    String path = kBaseurl + ApiEndPoints.forgotPWD;

    try {} catch (e) {}
  }
}
