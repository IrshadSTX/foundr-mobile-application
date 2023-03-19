import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';

class EventJoinService {
  Dio dio = Dio();
  Future<bool?> joinEvent(String token, String id, String joinLink) async {
    String path = kBaseurl + ApiEndPoints.joinEvent;
    try {
      Response response = await dio.post(path,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"eventId": id, "joinLink": joinLink});
      log(response.data.toString(), name: 'joineventSVC');
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 500) {
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
