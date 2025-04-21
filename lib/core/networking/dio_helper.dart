import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app_api/core/networking/api_endpoints.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio!.interceptors.add(PrettyDioLogger());
  }

  static getRequest({
    required String endPoint,
    required Map<String, dynamic> query,
  }) async {
    try {
      Response response = await dio!.get(endPoint, queryParameters: query);

      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  static postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.post(endPoint, data: data);

      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  static putRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.put(endPoint, data: data);

      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  static deleteRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.delete(endPoint, data: data);

      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  static patchRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.patch(endPoint, data: data);

      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
