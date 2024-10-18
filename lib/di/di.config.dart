// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter/material.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manager.dart' as _i3;
import '../data/contracts/auth/auth_online_datasource.dart' as _i4;
import '../data/data_source/auth/auth_online_data_source_imp.dart' as _i5;
import '../data/networking/common/regestet_context_module.dart' as _i24;
import '../data/networking/network_factory.dart' as _i23;
import '../data/repository/password_repository/forget_password_repo_imp.dart'
    as _i8;
import '../data/repository/password_repository/repository_impl.dart' as _i13;
import '../data/repository/password_repository/reset_password_repo_impl.dart'
    as _i15;
import '../data/repository/password_repository/verify_reset_code_repo_imp.dart'
    as _i18;
import '../domain/repository/forget_password_repo.dart' as _i7;
import '../domain/repository/repository.dart' as _i12;
import '../domain/repository/reset_password_repo.dart' as _i14;
import '../domain/repository/verify_reset_code_repo.dart' as _i17;
import '../domain/uses_cases/forget_password_use_case.dart' as _i9;
import '../domain/uses_cases/register_user_use_case.dart' as _i19;
import '../domain/uses_cases/reset_password_use_case.dart' as _i16;
import '../domain/uses_cases/verify_code_use_case.dart' as _i21;
import '../presentation/register_screen/view_model/register_view_model.dart'
    as _i20;
import '../presentation/view_models/forget_password_view_model.dart' as _i10;
import 'di.dart' as _i22;

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
    // final networkFactory = _$NetworkFactory();
    gh.factory<_i3.ApiManager>(() => registerModule.apiManager);
    gh.factory<_i4.AuthOnlineDataSource>(
        () => _i5.AuthOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    // gh.lazySingleton<_i6.Dio>(() => networkFactory.provideDio());
    gh.factory<_i7.ForgetPasswordRepo>(
        () => _i8.ForgetPasswordRepoImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i9.ForgetPasswordUseCase>(
        () => _i9.ForgetPasswordUseCase(gh<_i7.ForgetPasswordRepo>()));
    gh.factory<_i10.ForgetPasswordViewModel>(
        () => _i10.ForgetPasswordViewModel(gh<_i9.ForgetPasswordUseCase>()));
    // gh.lazySingleton<_i11.GlobalKey<_i11.NavigatorState>>(
    //     () => registerModule.navigatorKey);
    // gh.factory<_i6.LogInterceptor>(() => networkFactory.providerInterceptor());
    gh.factory<_i12.Repository>(
        () => _i13.RepositoryImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i14.ResetPasswordRepo>(
        () => _i15.ResetPasswordRepoImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i16.ResetPasswordUseCase>(
        () => _i16.ResetPasswordUseCase(gh<_i14.ResetPasswordRepo>()));
    gh.factory<_i17.VerifyResetCodeRepository>(
        () => _i18.VerifyResetCodeImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i19.RegisterUseCase>(
        () => _i19.RegisterUseCase(gh<_i12.Repository>()));
    gh.factory<_i20.RegisterViewModel>(
        () => _i20.RegisterViewModel(gh<_i19.RegisterUseCase>()));
    gh.factory<_i21.VerifyCodeUseCase>(
        () => _i21.VerifyCodeUseCase(gh<_i17.VerifyResetCodeRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i22.RegisterModule {}

// class _$NetworkFactory extends _i23.NetworkFactory {}

