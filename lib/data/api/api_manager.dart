import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/app/constants.dart';
import 'package:online_exam_app/data/api/api_constants.dart';
import 'package:online_exam_app/data/api/requests.dart';
import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../response/response.dart';

class ApiManager {
  late Dio _dio;

  ApiManager() {
    _initializeDio();
  }

  Future<void> _initializeDio() async {
    _dio = await getDio();
  }

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      responseType: ResponseType.json,
      receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
      sendTimeout: const Duration(milliseconds: Constants.apiTimeOut),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }


  Future<ForgotPasswordResponse> forgetPassword(String email) async {
    var response =
        await _dio.post(AppConstants.forgetPasswordApi, data: {'email': email});
    return ForgotPasswordResponse.fromJson(response.data);
  }

  Future<VerifyResetCodeResponse> verifyResetCode(String resetCode) async {
    var response = await _dio
        .post(AppConstants.verifyResetCodeApi, data: {'resetCode': resetCode});
    return VerifyResetCodeResponse.fromJson(response.data);
  }

  Future<ResetPasswordResponse> resetPassword(
      String email, String newPassword) async {
    var response = await _dio.put(AppConstants.resetPasswordApi,
        data: {'email': email, 'newPassword': newPassword});
    return ResetPasswordResponse.fromJson(response.data);
  }


  Future<AuthResponse> registerUser({required UserRequest userRequest}) async {
    Response<Map<String, dynamic>> response = await _dio.post(
      '${AppConstants.baseUrl}${AppConstants.signUpApi}',
      data: {
        "username": userRequest.username,
        "firstName": userRequest.firstName,
        "lastName": userRequest.lastName,
        "email": userRequest.email,
        "password": userRequest.password,
        "rePassword": userRequest.rePassword,
        "phone": userRequest.phone,
      },
    );
    return AuthResponse.fromJson(response.data ?? {});
  }
}
