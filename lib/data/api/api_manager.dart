import 'package:dio/dio.dart';
import 'package:online_exam_app/data/api/requests.dart';
import 'package:online_exam_app/data/api/api_constants.dart';
import 'package:online_exam_app/data/models/exam_response/SubjectsResponse.dart';
import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:online_exam_app/data/models/profile_response/EditProfileResponse.dart';
import '../response/response.dart';

class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
      ),
    );
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
  Future<Subjects> getSubjects(String token)async{
    var response = await _dio.get(AppConstants.getSubjectsApi,data: {
      'token' : token,
    });
    return Subjects.fromJson(response.data);
  }
}
