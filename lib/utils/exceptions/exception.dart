import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';

class DioException {
  var dio = Dio();

  void dioError(Object e, BuildContext context) {
    if (e is DioError) {
      if (e.response?.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.response?.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
