import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';
import 'package:foundr_project/model/api/notification/notification_model.dart';

class NotificationServices {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  Future<List<NotificationElement>?> getAllNotificationServices() async {
    String path = kBaseurl + ApiEndPoints.getNotifications;
    String? token = await storage.read(key: 'token');
    try {
      Response response = await dio.get(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['notifications'];
        final res = data.map((e) => NotificationElement.fromJson(e)).toList();
        log(res.toString());
        return res;
      }
    } catch (e) {
      log(e.toString(), name: 'getNotifiError');
    }
    return null;
  }
}
