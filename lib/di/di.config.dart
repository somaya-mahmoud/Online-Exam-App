// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manager.dart' as _i3;
import '../data/contracts/auth/auth_online_datasource.dart' as _i4;
import '../data/data_source/cache_data_source/cache_data_source.dart' as _i9;
import '../data/data_source/remote_data_source/auth/auth_online_data_source_imp.dart'
    as _i5;
import '../data/network/network_info.dart' as _i6;
import '../data/repository/authentication_repository_impl/authentication_repository_impl.dart'
    as _i8;
import '../data/repository/edit_profile_repository/edit_profile_repo_imp.dart'
    as _i12;
import '../data/repository/password_repository/forget_password_repo_imp.dart'
    as _i16;
import '../data/repository/password_repository/reset_password_repo_impl.dart'
    as _i25;
import '../data/repository/password_repository/verify_reset_code_repo_imp.dart'
    as _i29;
import '../data/services/user_manager.dart' as _i10;
import '../domain/repository/auth_repository/authentication_repository.dart'
    as _i7;
import '../domain/repository/password/forget_password_repo.dart' as _i15;
import '../domain/repository/password/reset_password_repo.dart' as _i24;
import '../domain/repository/password/verify_reset_code_repo.dart' as _i28;
import '../domain/repository/profile/edit_profile_repo.dart' as _i11;
import '../domain/uses_cases/authentication_use_case/login_use_case.dart'
    as _i20;
import '../domain/uses_cases/authentication_use_case/register_user_use_case.dart'
    as _i22;
import '../domain/uses_cases/forget_password_use_cases/forget_password_use_case.dart'
    as _i17;
import '../domain/uses_cases/forget_password_use_cases/reset_password_use_case.dart'
    as _i26;
import '../domain/uses_cases/forget_password_use_cases/verify_code_use_case.dart'
    as _i30;
import '../domain/uses_cases/profile_use_cases/edit_profile_use_case.dart'
    as _i13;
import '../presentation/login/view_models/login_view_model.dart' as _i21;
import '../presentation/register_screen/view_model/register_view_model.dart'
    as _i23;
import '../presentation/view_models/forget_password_view_model.dart' as _i18;
import '../presentation/view_models/password_view_models/forget_password_view_model.dart'
    as _i19;
import '../presentation/view_models/password_view_models/reset_password_view_model.dart'
    as _i27;
import '../presentation/view_models/password_view_models/verify_email_view_model.dart'
    as _i31;
import '../presentation/view_models/profile_view_models/edit_profile_view_model.dart'
    as _i14;
import 'di.dart' as _i32;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.ApiManager>(() => registerModule.apiManager);
    gh.factory<_i4.AuthOnlineDataSource>(() => _i5.AuthOnlineDataSourceImpl(
          gh<_i3.ApiManager>(),
          gh<_i6.NetworkInfo>(),
        ));
    gh.factory<_i7.AuthenticationRepository>(() => _i8.RepositoryImpl(
          gh<_i4.AuthOnlineDataSource>(),
        ));
    gh.factory<_i11.EditProfileRepo>(
        () => _i12.EditProfileRepoImp(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i13.EditProfileUseCase>(
        () => _i13.EditProfileUseCase(gh<_i11.EditProfileRepo>()));
    gh.factory<_i14.EditProfileViewModel>(
        () => _i14.EditProfileViewModel(gh<_i13.EditProfileUseCase>()));
    gh.factory<_i15.ForgetPasswordRepo>(
        () => _i16.ForgetPasswordRepoImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i17.ForgetPasswordUseCase>(
        () => _i17.ForgetPasswordUseCase(gh<_i15.ForgetPasswordRepo>()));
    gh.factory<_i18.ForgetPasswordViewModel>(
        () => _i18.ForgetPasswordViewModel(gh<_i17.ForgetPasswordUseCase>()));
    gh.factory<_i19.ForgetPasswordViewModel>(
        () => _i19.ForgetPasswordViewModel(gh<_i17.ForgetPasswordUseCase>()));
    gh.factory<_i20.LoginUseCase>(
        () => _i20.LoginUseCase(gh<_i7.AuthenticationRepository>()));
    gh.factory<_i21.LoginViewModel>(
        () => _i21.LoginViewModel(gh<_i20.LoginUseCase>()));
    gh.factory<_i22.RegisterUseCase>(
        () => _i22.RegisterUseCase(gh<_i7.AuthenticationRepository>()));
    gh.factory<_i23.RegisterViewModel>(
        () => _i23.RegisterViewModel(gh<_i22.RegisterUseCase>()));
    gh.factory<_i24.ResetPasswordRepo>(
        () => _i25.ResetPasswordRepoImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i26.ResetPasswordUseCase>(
        () => _i26.ResetPasswordUseCase(gh<_i24.ResetPasswordRepo>()));
    gh.factory<_i27.ResetPasswordViewModel>(
        () => _i27.ResetPasswordViewModel(gh<_i26.ResetPasswordUseCase>()));
    gh.factory<_i28.VerifyResetCodeRepository>(
        () => _i29.VerifyResetCodeImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i30.VerifyCodeUseCase>(
        () => _i30.VerifyCodeUseCase(gh<_i28.VerifyResetCodeRepository>()));
    gh.factory<_i31.VerifyEmailViewModel>(
        () => _i31.VerifyEmailViewModel(gh<_i30.VerifyCodeUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i32.RegisterModule {}
