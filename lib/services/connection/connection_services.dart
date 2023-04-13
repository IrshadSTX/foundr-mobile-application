import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';
import 'package:foundr_project/model/api/connections/connection_resp_req_model.dart';
import 'package:foundr_project/model/api/connections/connectin_req.dart';
import 'package:foundr_project/model/api/connections/connection_update.dart';
import 'package:foundr_project/model/api/connections/get_connection_model.dart';

class ConnectionServices {
  Dio dio = Dio();

  //------ send connection------//

  Future<bool?> sendConnectionService(
      ConnectionReqModel model, String token) async {
    final path = kBaseurl + ApiEndPoints.connectionReq;
    try {
      Response response = await dio.post(path,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
          data: jsonEncode(model.toJson()));
      log(response.data.toString(), name: 'connectionReq');
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode != 201) {
        return false;
      }
    } catch (e) {
      log(e.toString(), name: 'connectionReqError');
    }
    return null;
  }

//------ get all connection requests------//
  Future<List<ConnectionRequest>?> getConnectionReqService(String token) async {
    String path = kBaseurl + ApiEndPoints.connectionReq;
    try {
      Response response = await dio.get(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['connectionRequests'];
        final result = data.map((e) => ConnectionRequest.fromJson(e)).toList();
        log(result.toString(), name: 'getConnection');
        return result;
      }
    } catch (e) {
      log(e.toString(), name: 'getconnectionError');
    }
    return null;
  }
  //------ to update connection request------//

  Future<bool?> updateConnectionService(
      ConnectionUpdateModel model, String token) async {
    String path = kBaseurl + ApiEndPoints.connectionReq;
    try {
      Response response = await dio.patch(path,
          data: jsonEncode(model.toJson()),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString(), name: 'updateConnectionError');
    }
    return null;
  }

  //------ to get all teh connections------//
  Future<List<Connection>?> getAllConnectionService(String token) async {
    String path = kBaseurl + ApiEndPoints.getAllConnection;
    try {
      Response response = await dio.get(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      log(response.data.toString(), name: 'allconnection');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['connections'];
        final result = data.map((e) => Connection.fromJson(e)).toList();
        return result;
      }
    } catch (e) {
      log(e.toString(), name: 'getAllConnectionError');
    }
    return null;
  }
}
