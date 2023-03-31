import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';
import 'package:foundr_project/model/api/profile/profile_user_model.dart';
import 'package:foundr_project/model/api/profile/update_profile_model.dart';

class UserProfileServices {
  Dio dio = Dio();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  //Function for calling user Details
  Future<UserDetails?> getUserDetails() async {
    String path = kBaseurl + ApiEndPoints.getUser;
    String? token = await storage.read(key: 'token');
    final option = Options(headers: {'Authorization': 'Bearer $token'});
    try {
      Response response = await dio.get(path, options: option);

      //
      log(response.data.toString(), name: 'getUser');
      if (response.statusCode == 200) {
        final json = response.data["userDetails"];
        final res = UserDetails.fromJson(json);
        return res;
      }
    } catch (e) {
      log(e.toString(), name: 'userCatch');
    }
    return null;
  }

  //Function for update profile images
  Future<bool?> profileUpdate(String imagepath) async {
    String path = kBaseurl + ApiEndPoints.getUserPhoto;
    String? token = await storage.read(key: "token");
    try {
      Response response = await dio.post(
        path,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: {"file": imagepath},
      );
      log(response.data.toString());
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 401) {
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<bool?> updateUserService(UpdateUseraboutModel model) async {
    final path = kBaseurl + ApiEndPoints.updateUserProfile;
    final token = await storage.read(key: 'token');

    try {
      Response response = await dio.post(path,
          data: jsonEncode(model.toJson()),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 401 || response.statusCode == 500) {
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
