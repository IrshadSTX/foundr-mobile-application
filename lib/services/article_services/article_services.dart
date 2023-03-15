import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/core/api/end_points.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/model/api/article/article_model.dart';
import 'package:foundr_project/utils/exceptions/exception.dart';

class ArticleService {
  Dio dio = Dio();

  Future<List<Article>?> getArticleService(BuildContext context) async {
    try {
      Response response = await dio.get(
        kBaseurl + ApiEndPoints.getArticles,
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['articles'];
        final res = data.map((e) => Article.fromJson(e)).toList();

        return res;
      } else if (response.statusCode == 501) {
        ScaffoldMessenger.of(context).showSnackBar(dataFailsMsg);
      }
    } on DioError catch (e) {
      DioException().dioError(e, context);
      log(e.toString());
    }
    return null;
  }
}
