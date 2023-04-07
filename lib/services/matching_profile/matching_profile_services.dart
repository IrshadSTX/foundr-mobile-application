import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';
import 'package:foundr_project/model/api/matching_profile/matching_profile_model.dart';

class MatchingProfileServices {
  Dio dio = Dio();
  Future<List<MatchingProfile>?> getMatchingProfileService(String token) async {
    String path = kBaseurl + ApiEndPoints.matchingProfile;
    try {
      Response response = await dio.get(
        path,
        options: Options(
          followRedirects: false,
          headers: {'Authorization': 'Bearer $token'},
          validateStatus: (status) => status! < 599,
        ),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['matchingProfiles'];
        final res = data.map((e) => MatchingProfile.fromJson(e)).toList();
        log('inside matchingprofiles');
        return res;
      } else {
        log('error', name: 'matching profile services');
      }
    } catch (e) {
      log('error from matching');
    }
    log('null from matching profile');
    return null;
  }
}
