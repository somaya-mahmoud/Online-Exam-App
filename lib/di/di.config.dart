// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manager.dart' as _i3;
import '../data/contracts/auth/auth_online_datasource.dart' as _i4;
import '../data/data_source/auth/auth_online_data_source_imp.dart' as _i5;
import '../data/networking/common/regestet_context_module.dart' as _i24;
import '../data/repository/password_repository/forget_password_repo_imp.dart'
    as _i7;
import '../data/repository/password_repository/repository_impl.dart' as _i14;
import '../data/repository/password_repository/reset_password_repo_impl.dart'
    as _i16;
import '../data/repository/password_repository/verify_reset_code_repo_imp.dart'
    as _i19;
import '../domain/repository/forget_password_repo.dart' as _i6;
import '../domain/repository/repository.dart' as _i13;
import '../domain/repository/reset_password_repo.dart' as _i15;
import '../domain/repository/verify_reset_code_repo.dart' as _i18;
import '../domain/uses_cases/forget_password_use_case.dart' as _i8;
import '../domain/uses_cases/login_use_case.dart' as _i11;
import '../domain/uses_cases/register_user_use_case.dart' as _i20;
import '../domain/uses_cases/reset_password_use_case.dart' as _i17;
import '../domain/uses_cases/verify_code_use_case.dart' as _i22;
import '../presentation/login/view_models/login_view_model.dart' as _i12;
import '../presentation/register_screen/view_model/register_view_model.dart'
    as _i21;
import '../presentation/view_models/forget_password_view_model.dart' as _i9;
import 'di.dart' as _i23;

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
    gh.factory<_i4.AuthOnlineDataSource>(
        () => _i5.AuthOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.ForgetPasswordRepo>(
        () => _i7.ForgetPasswordRepoImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i8.ForgetPasswordUseCase>(
        () => _i8.ForgetPasswordUseCase(gh<_i6.ForgetPasswordRepo>()));
    gh.factory<_i9.ForgetPasswordViewModel>(
        () => _i9.ForgetPasswordViewModel(gh<_i8.ForgetPasswordUseCase>()));

    gh.factory<_i11.LoginUseCase>(() => _i11.LoginUseCase());
    gh.factory<_i12.LoginViewModel>(() => _i12.LoginViewModel());
    gh.factory<_i13.Repository>(
        () => _i14.RepositoryImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i15.ResetPasswordRepo>(
        () => _i16.ResetPasswordRepoImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i17.ResetPasswordUseCase>(
        () => _i17.ResetPasswordUseCase(gh<_i15.ResetPasswordRepo>()));
    gh.factory<_i18.VerifyResetCodeRepository>(
        () => _i19.VerifyResetCodeImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i20.RegisterUseCase>(
        () => _i20.RegisterUseCase(gh<_i13.Repository>()));
    gh.factory<_i21.RegisterViewModel>(
        () => _i21.RegisterViewModel(gh<_i20.RegisterUseCase>()));
    gh.factory<_i22.VerifyCodeUseCase>(
        () => _i22.VerifyCodeUseCase(gh<_i18.VerifyResetCodeRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i23.RegisterModule {}

