import 'dart:io';
import 'package:dio/dio.dart';
import '../../data/models/error_model/ErrorModel.dart';

class ErrorHandler {
  static ErrorModel handle(Exception error) {
    if (error is DioException) {
      return _handleDioException(error);
    } else if (error is IOException) {
      return ErrorModel(message: "No internet connection");
    } else {
      return ErrorModel(message: "An unknown error occurred");
    }
  }

  static ErrorModel _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorModel(message: "Connection timeout with the server");

      case DioExceptionType.sendTimeout:
        return ErrorModel(message: "Send timeout while trying to connect to the server");

      case DioExceptionType.receiveTimeout:
        return ErrorModel(message: "Receive timeout while connecting to the server");

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return ErrorModel(message: "Request was cancelled");

      case DioExceptionType.connectionError:
        return ErrorModel(message: "Failed to connect to the server");

      case DioExceptionType.unknown:
        return ErrorModel(message: "An unexpected error occurred");

      default:
        return ErrorModel(message: "Something went wrong");
    }
  }

  static ErrorModel _handleBadResponse(DioException error) {
    // Check if the server responded with a specific error
    if (error.response?.data != null && error.response!.data is Map<String, dynamic>) {
      return ErrorModel.fromMap(error.response!.data as Map<String, dynamic>);
    } else {
      return ErrorModel(message: "Server responded with an unknown error");
    }
  }
}
