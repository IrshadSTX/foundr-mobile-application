import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';
import 'package:foundr_project/model/api/message/get_message_model.dart';
import 'package:foundr_project/model/api/message/send_message_model.dart';

class MessageService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<List<GetMessageModel>?> getMessageService(String selectedId) async {
    String? path = kBaseurl + ApiEndPoints.chatting;
    String? token = await storage.read(key: 'token');
    try {
      final option = Options(headers: {'Authorization': 'bearer $token'});
      Response response = await dio.get(path,
          queryParameters: {'to': selectedId}, options: option);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final result = data.map((e) => GetMessageModel.fromJson(e)).toList();
        return result;
      }
    } catch (e) {
      log(e.toString(), name: 'getMessageError');
    }
    return null;
  }

  Future<void> sendMessageService(MessageSendModel model) async {
    String? token = await storage.read(key: 'token');
    String path = kBaseurl + ApiEndPoints.chatting;
    try {
      final option = Options(headers: {'Authorization': 'bearer $token'});
      Response response = await dio.post(path,
          data: jsonEncode(model.toJson()), options: option);
      if (response.statusCode == 201) {
        log("message send", name: 'sendMessageMS');
      }
    } catch (e) {
      log(e.toString(), name: 'sendMessageError');
    }
  }
}
