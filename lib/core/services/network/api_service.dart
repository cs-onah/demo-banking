import 'dart:convert';

import 'package:demo_banking/core/constants/logger.dart';
import 'package:demo_banking/core/constants/url_config.dart';
import 'package:demo_banking/core/services/network/api_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Abstraction of Http Service
class ApiService {
  static const connectTimeOut = Duration(seconds: 120);
  static const receiverTimeOut = Duration(seconds: 120);
  late Dio dio;
  late bool showLog;

  final _dioBaseOptions = BaseOptions(
    connectTimeout: connectTimeOut,
    receiveTimeout: receiverTimeOut,
    baseUrl: UrlConfig.baseUrl,
    headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
  );

  ApiService({String? baseUrl}) {
    dio = Dio();
    dio.options = _dioBaseOptions;
    if (baseUrl != null) dio.options.baseUrl = baseUrl;
  }

  Future<Response> call(
    String path,
    RequestMethod method, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? header,
    data,
    bool showLog = false,
  }) async {
    Response? response;
    var params = queryParams ?? {};

    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio.post(
            path,
            queryParameters: params,
            data: data,
            options: Options(headers: header),
          );
          break;
        case RequestMethod.get:
          response = await dio.get(
            path,
            queryParameters: params,
            options: Options(headers: header),
          );
          break;
        case RequestMethod.put:
          response = await dio.put(
            path,
            queryParameters: params,
            data: data,
            options: Options(headers: header),
          );
          break;
        case RequestMethod.patch:
          response = await dio.patch(
            path,
            queryParameters: params,
            data: data,
            options: Options(headers: header),
          );
          break;
        case RequestMethod.delete:
          response = await dio.delete(
            path,
            queryParameters: params,
            data: data,
            options: Options(headers: header),
          );
          break;
      }
      if (showLog) {
        if (data != null) devLog(jsonEncode(data));
        devLog.success("$method | $path: ${response.statusCode} code");
        devLog("API response: $response");
      }
      return response;
    } on DioException catch (error, stackTrace) {
      if (showLog) {
        if (data != null) devLog(jsonEncode(data));
        devLog.error("$method | $path: ${error.response?.statusCode} code");
        devLog("API response: ${error.response}");
      }
      final apiError = ApiError.fromDioError(error);
      return Future.error(apiError, stackTrace);
    } catch (_) {
      rethrow;
    }
  }
}

enum RequestMethod { post, get, put, delete, patch }

final apiService = Provider<ApiService>((ref) => ApiService());
