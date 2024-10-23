import 'package:dio/dio.dart';

class ServerError implements Exception {
  String? errorMessage;
  int? statusCode;
  String? serverMessage;
  ServerError(this.errorMessage, this.statusCode, this.serverMessage);
}

class DioHttpException implements Exception {
  DioException? exception;
  DioHttpException(this.exception);
}

class NoInternetError implements Exception {}
