import 'package:cubitdemo/src/domain/network_service/dio_injector.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  Dio dio = getDio();

  Options options = Options(
      contentType: "application/json", receiveDataWhenStatusError: true);

  Map<String, dynamic> headers = {"isAuthRequired": "Bearer token"};

  //GET
  Future<dynamic> get(
      {required String url, bool isAuthRequired = false}) async {
    if (isAuthRequired) {
      options.headers = headers;
    }

    try {
      Response response = await dio.get(url, options: options);
      return response.data;
    } catch (error) {
      debugPrint("ERR $error");
      return null;
    }
  }
}
