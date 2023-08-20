import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: '',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept':'application/json',
      'Content-Type': 'application/json',
    'Authorization': token ?? '',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept':'application/json',
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data ,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept':'application/json',
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return dio.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept':'application/json',
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return dio.patch(
      url,
      queryParameters: query,
      data: data ,
    );
  }
}



