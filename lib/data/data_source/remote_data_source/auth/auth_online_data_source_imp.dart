import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_excute.dart';
import 'package:online_exam_app/data/api/api_manager.dart';
import 'package:online_exam_app/data/network/requests.dart';
import 'package:online_exam_app/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:online_exam_app/data/models/profile_response/EditProfileResponse.dart';

import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';

import '../../../models/login_response/LoginResponse.dart';
import '../../../network/network_info.dart';
import '../../../response/response.dart';
import '../../../services/user_manager.dart';
import '../../cache_data_source/cache_data_source.dart';



@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  late final ApiManager apiManager;
  final NetworkInfo networkInfo;
  // final AppCacheDataSource _cacheDataSource;
  // final UserManager _userManager;


  AuthOnlineDataSourceImpl(this.apiManager, this.networkInfo,);

  @override
  Future<ApiResult<ForgotPasswordResponse>> forgetPassword(String email) async {
    if (await networkInfo.isConnected) {
      return executeApi<ForgotPasswordResponse>(() async {
        return await apiManager.forgetPassword(email);
      });
    } else {
      return Fail(AppStrings.noInternetError.tr());
    }
  }

  @override
  Future<ApiResult<VerifyResetCodeResponse>>? verifyResetCode(String resetCode) async {
    if (await networkInfo.isConnected) {
      return executeApi<VerifyResetCodeResponse>(() async {
        return await apiManager.verifyResetCode(resetCode);
      });
    } else {
      return Fail(AppStrings.noInternetError.tr());
    }
  }

  @override
  Future<ApiResult<ResetPasswordResponse>>? resetPassword(String email, String newPassword) async {
    if (await networkInfo.isConnected) {
      return executeApi<ResetPasswordResponse>(() async {

        return await apiManager.resetPassword(email, newPassword);
      });
    } else {
      return Fail(AppStrings.noInternetError.tr());
    }
  }

  @override
  Future<ApiResult<AuthResponse>> registerUser({required UserRequest userRequest}) async {
    if (await networkInfo.isConnected) {


      return executeApi<AuthResponse>(() async {


        return await apiManager.registerUser(userRequest: userRequest);

      });
    } else {
      return Fail(AppStrings.noInternetError.tr());
    }
  }

  @override
  Future<ApiResult<LoginResponse>> loginUser({required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      return executeApi<LoginResponse>(() async {
        return await apiManager.login(email: email, password: password);
      });
    } else {
      return Fail(AppStrings.noInternetError.tr());
    }
  }

  @override
  Future<ApiResult<EditProfileResponse>>? editProfile(String userName, String firstName, String lastName, String email, String password, String phone) async {
    if (await networkInfo.isConnected) {
      return executeApi<EditProfileResponse>(() async {
        return await apiManager.editProfile(userName, firstName, lastName, email, password, phone);
      });
    } else {
      return Fail(AppStrings.noInternetError.tr());
    }
  }
}

