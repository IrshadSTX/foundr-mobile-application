import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/model/api/events/events_model.dart';

class EventService {
  Dio dio = Dio();
  String path = kBaseurl + ApiEndPoints.getEvents;
  Future<List<EventModel>?> getEventService(BuildContext context) async {
    try {
      Response response = await dio.get(path);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['events'];
        final res = data.map((e) => EventModel.fromJson(e)).toList();
        return res;
      } else if (response.statusCode == 501) {
        ScaffoldMessenger.of(context).showSnackBar(dataFailsMsg);
      }
    } catch (e) {
      log(e.toString());
    }
    log('null in getevent service');
    return null;
  }
}
