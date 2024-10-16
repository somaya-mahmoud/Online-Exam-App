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
import '../data/data_source/auth/auth_online_data_source_imp.dart' as _i5;
import '../data/repository/edit_profile_repository/edit_profile_repo_imp.dart'
    as _i7;
import '../data/repository/password_repository/forget_password_repo_imp.dart'
    as _i11;
import '../data/repository/password_repository/reset_password_repo_impl.dart'
    as _i15;
import '../data/repository/password_repository/verify_reset_code_repo_imp.dart'
    as _i19;
import '../domain/repository/password/forget_password_repo.dart' as _i10;
import '../domain/repository/password/reset_password_repo.dart' as _i14;
import '../domain/repository/password/verify_reset_code_repo.dart' as _i18;
import '../domain/repository/profile/edit_profile_repo.dart' as _i6;
import '../domain/uses_cases/forget_password_use_cases/forget_password_use_case.dart'
    as _i12;
import '../domain/uses_cases/forget_password_use_cases/reset_password_use_case.dart'
    as _i16;
import '../domain/uses_cases/forget_password_use_cases/verify_code_use_case.dart'
    as _i20;
import '../domain/uses_cases/profile_use_cases/edit_profile_use_case.dart'
    as _i8;
import '../presentation/view_models/password_view_models/forget_password_view_model.dart'
    as _i13;
import '../presentation/view_models/password_view_models/reset_password_view_model.dart'
    as _i17;
import '../presentation/view_models/password_view_models/verify_email_view_model.dart'
    as _i21;
import '../presentation/view_models/profile_view_models/edit_profile_view_model.dart'
    as _i9;
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
    gh.factory<_i3.ApiManager>(() => registerModule.apiManager);
    gh.factory<_i4.AuthOnlineDataSource>(
        () => _i5.AuthOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.EditProfileRepo>(
        () => _i7.EditProfileRepoImp(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i8.EditProfileUseCase>(
        () => _i8.EditProfileUseCase(gh<_i6.EditProfileRepo>()));
    gh.factory<_i9.EditProfileViewModel>(
        () => _i9.EditProfileViewModel(gh<_i8.EditProfileUseCase>()));
    gh.factory<_i10.ForgetPasswordRepo>(
        () => _i11.ForgetPasswordRepoImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i12.ForgetPasswordUseCase>(
        () => _i12.ForgetPasswordUseCase(gh<_i10.ForgetPasswordRepo>()));
    gh.factory<_i13.ForgetPasswordViewModel>(
        () => _i13.ForgetPasswordViewModel(gh<_i12.ForgetPasswordUseCase>()));
    gh.factory<_i14.ResetPasswordRepo>(
        () => _i15.ResetPasswordRepoImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i16.ResetPasswordUseCase>(
        () => _i16.ResetPasswordUseCase(gh<_i14.ResetPasswordRepo>()));
    gh.factory<_i17.ResetPasswordViewModel>(
        () => _i17.ResetPasswordViewModel(gh<_i16.ResetPasswordUseCase>()));
    gh.factory<_i18.VerifyResetCodeRepository>(
        () => _i19.VerifyResetCodeImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i20.VerifyCodeUseCase>(
        () => _i20.VerifyCodeUseCase(gh<_i18.VerifyResetCodeRepository>()));
    gh.factory<_i21.VerifyEmailViewModel>(
        () => _i21.VerifyEmailViewModel(gh<_i20.VerifyCodeUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i22.RegisterModule {}
