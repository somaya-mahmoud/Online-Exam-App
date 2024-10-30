import 'package:dio/dio.dart';
import 'package:online_exam_app/data/api/requests.dart';
import 'package:online_exam_app/data/api/api_constants.dart';
import 'package:online_exam_app/data/models/exam_response/ExamsResponse.dart';
import 'package:online_exam_app/data/models/exam_response/SubjectsResponse.dart';
import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:online_exam_app/data/models/profile_response/EditProfileResponse.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../response/response.dart';
import 'package:flutter/foundation.dart';

class ApiManager {
  late Dio _dio;
  ApiManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['token'] =
              //'${SharedPrefHelper().getString(key: SharedPrefKeys.token)}';
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDdiNzlhZTc3ZDY4NTk1YTI5MjMwNSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzMwMjMzMjExfQ.AXKK1HSzgqLz_eNS0NpeRWK54f_fN-SZjbVJwX-uQNA';
          return handler.next(options);
        },
        onError: (error, handler) {
          // if (error.response!= null) {
          //   if ( error.response!.statusCode==401) {
          //     // Handle 400 or 401 error
          //     SharedPrefHelper().clearPreferences();
          //     // Navigate to login screen or handle error accordingly
          //   }
          // }
        },
      ),
    );

    if (!kReleaseMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
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

  Future<EditProfileResponse> editProfile(String userName, String firstName,
      String lastName, String email, String password, String phone) async {
    var response = await _dio.put(AppConstants.editProfileApi, data: {
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
    });
    return EditProfileResponse.fromJson(response.data);
  }

  Future<SubjectsResponse> getSubjects() async {
    var response = await _dio.get(
      AppConstants.getSubjectsApi,
    );
    print(' data is : ${response.data}');
    return SubjectsResponse.fromJson(response.data);
  }

  Future<ExamsResponse> getExams() async {
    var response = await _dio.get(
      AppConstants.getExamsApi,
    );
    print(' data is : ${response.data}');
    return ExamsResponse.fromJson(response.data);
  }
}
