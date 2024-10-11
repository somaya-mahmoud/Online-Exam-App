import 'package:dio/dio.dart';

class ServerError implements Exception {
  String? errorMessage;
  int? statusCode;
  ServerError(this.errorMessage, this.statusCode);
}

class DioHttpException implements Exception {
  DioException? exception;
  DioHttpException(this.exception);
}

class NoInternetError implements Exception {}
