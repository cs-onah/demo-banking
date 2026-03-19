import 'package:dio/dio.dart';

class ApiError {
  final int? statusCode;
  final String message;
  ApiError(this.statusCode, this.message);


  factory ApiError.fromDioError(DioException exception) {
    final message = exception.response?.data["message"] ?? exception.message;
    return ApiError(exception.response?.statusCode, message);
  }

}