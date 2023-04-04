import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/model/api/matching_profile/matching_profile_model.dart';
import 'package:foundr_project/services/matching_profile/matching_profile_services.dart';

class MatchingProfileProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  List<MatchingProfile>? matchingProfileDatas;
  Future<void> getAllMatchingProfiles() async {
    String? token = await storage.read(key: 'token');
    MatchingProfileServices()
        .getMatchingProfileService(token.toString())
        .then((value) => matchingProfileDatas = value);
  }
}
