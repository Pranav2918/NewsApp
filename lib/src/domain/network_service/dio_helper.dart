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

  //POST
  Future<dynamic> post(
      {required String url,
      Object? requestBody,
      bool isAuthRequired = false}) async {
    if (isAuthRequired) {
      options.headers = headers;
    }

    try {
      Response response;
      if (requestBody == null) {
        response = await dio.post(url, options: options);
      } else {
        response = await dio.post(url, data: requestBody, options: options);
      }
      return response.data;
    } catch (error) {
      debugPrint("ERR $error");
      return null;
    }
  }

  //PUT
  Future<dynamic> put({
    required String url,
    required Object data,
    bool isAuthRequired = false,
  }) async {
    if (isAuthRequired) {
      options.headers = headers;
    }

    try {
      Response response = await dio.put(url, data: data, options: options);
      return response.data;
    } catch (error) {
      debugPrint("ERR $error");
      return null;
    }
  }

  //DELETE
  Future<dynamic> delete({
    required String url,
    bool isAuthRequired = false,
  }) async {
    if (isAuthRequired) {
      options.headers = headers;
    }

    try {
      Response response = await dio.delete(url, options: options);
      return response
          .data; // Depending on your API, DELETE might not return data
    } catch (error) {
      debugPrint("ERR $error");
      return null;
    }
  }

  //MULTIPART POST
  Future<dynamic> multipartPost(
      {required String url,
      required Object requestBody,
      bool isAuthRequired = false}) async {
    Options options = Options(headers: {"Content-Type": "multipart/form-data"});
    try {
      Response response;
      response = await dio.post(url, data: requestBody, options: options);
      return response.data;
    } catch (error) {
      debugPrint("ERR $error");
      return null;
    }
  }
}
