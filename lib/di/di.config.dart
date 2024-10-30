// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manager.dart' as _i3;
import '../data/contracts/auth/auth_online_datasource.dart' as _i4;
import '../data/contracts/exam/exam_online_data_source.dart' as _i10;
import '../data/data_source/auth/auth_online_data_source_imp.dart' as _i5;
import '../data/data_source/exam/exam_online_data_source_impl.dart' as _i11;
import '../data/networking/common/regestet_context_module.dart' as _i40;
import '../data/repository/edit_profile_repository/edit_profile_repo_imp.dart'
    as _i7;
import '../data/repository/exam_repository/exams_repo_impl.dart' as _i13;
import '../data/repository/exam_repository/subjects_repo_impl.dart' as _i29;
import '../data/repository/password_repository/forget_password_repo_imp.dart'
    as _i15;
import '../data/repository/password_repository/repository_impl.dart' as _i23;
import '../data/repository/password_repository/reset_password_repo_impl.dart'
    as _i25;
import '../data/repository/password_repository/verify_reset_code_repo_imp.dart'
    as _i31;
import '../domain/repository/exam/exams_repo.dart' as _i12;
import '../domain/repository/exam/subjects_repo.dart' as _i28;
import '../domain/repository/password/forget_password_repo.dart' as _i14;
import '../domain/repository/password/reset_password_repo.dart' as _i24;
import '../domain/repository/password/verify_reset_code_repo.dart' as _i30;
import '../domain/repository/profile/edit_profile_repo.dart' as _i6;
import '../domain/repository/repository.dart' as _i22;
import '../domain/uses_cases/exam_use_cases/exams_use_case.dart' as _i18;
import '../domain/uses_cases/exam_use_cases/subjects_use_case.dart' as _i33;
import '../domain/uses_cases/forget_password_use_cases/forget_password_use_case.dart'
    as _i16;
import '../domain/uses_cases/forget_password_use_cases/reset_password_use_case.dart'
    as _i26;
import '../domain/uses_cases/forget_password_use_cases/verify_code_use_case.dart'
    as _i37;
import '../domain/uses_cases/login_use_case.dart' as _i20;
import '../domain/uses_cases/profile_use_cases/edit_profile_use_case.dart'
    as _i8;
import '../domain/uses_cases/register_user_use_case.dart' as _i34;
import '../presentation/screens/login/view_models/login_view_model.dart'
    as _i21;
import '../presentation/screens/register_screen/view_model/register_view_model.dart'
    as _i35;
import '../presentation/view_models/exam_view_models/exams_view_model.dart'
    as _i32;
import '../presentation/view_models/exam_view_models/subjects_view_model.dart'
    as _i36;
import '../presentation/view_models/password_view_models/forget_password_view_model.dart'
    as _i17;
import '../presentation/view_models/password_view_models/reset_password_view_model.dart'
    as _i27;
import '../presentation/view_models/password_view_models/verify_email_view_model.dart'
    as _i38;
import '../presentation/view_models/profile_view_models/edit_profile_view_model.dart'
    as _i9;
import 'di.dart' as _i39;

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
    gh.factory<_i10.ExamOnlineOnlineSource>(
        () => _i11.ExamOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.ExamsRepo>(
        () => _i13.ExamsRepoImpl(gh<_i10.ExamOnlineOnlineSource>()));
    gh.factory<_i14.ForgetPasswordRepo>(
        () => _i15.ForgetPasswordRepoImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i16.ForgetPasswordUseCase>(
        () => _i16.ForgetPasswordUseCase(gh<_i14.ForgetPasswordRepo>()));
    gh.factory<_i17.ForgetPasswordViewModel>(
        () => _i17.ForgetPasswordViewModel(gh<_i16.ForgetPasswordUseCase>()));
    gh.factory<_i18.GetExamsUseCase>(
        () => _i18.GetExamsUseCase(gh<_i12.ExamsRepo>()));
    gh.factory<_i20.LoginUseCase>(() => _i20.LoginUseCase());
    gh.factory<_i21.LoginViewModel>(() => _i21.LoginViewModel());
    gh.factory<_i22.Repository>(
        () => _i23.RepositoryImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i24.ResetPasswordRepo>(
        () => _i25.ResetPasswordRepoImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i26.ResetPasswordUseCase>(
        () => _i26.ResetPasswordUseCase(gh<_i24.ResetPasswordRepo>()));
    gh.factory<_i27.ResetPasswordViewModel>(
        () => _i27.ResetPasswordViewModel(gh<_i26.ResetPasswordUseCase>()));
    gh.factory<_i28.SubjectsRepo>(
        () => _i29.SubjectsRepoImpl(gh<_i10.ExamOnlineOnlineSource>()));
    gh.factory<_i30.VerifyResetCodeRepository>(
        () => _i31.VerifyResetCodeImpl(gh<_i4.AuthOnlineDataSource>()));
    gh.factory<_i32.ExamsViewModel>(
        () => _i32.ExamsViewModel(gh<_i18.GetExamsUseCase>()));
    gh.factory<_i33.GetSubjectsUseCase>(
        () => _i33.GetSubjectsUseCase(gh<_i28.SubjectsRepo>()));
    gh.factory<_i34.RegisterUseCase>(
        () => _i34.RegisterUseCase(gh<_i22.Repository>()));
    gh.factory<_i35.RegisterViewModel>(
        () => _i35.RegisterViewModel(gh<_i34.RegisterUseCase>()));
    gh.factory<_i36.SubjectsViewModel>(
        () => _i36.SubjectsViewModel(gh<_i33.GetSubjectsUseCase>()));
    gh.factory<_i37.VerifyCodeUseCase>(
        () => _i37.VerifyCodeUseCase(gh<_i30.VerifyResetCodeRepository>()));
    gh.factory<_i38.VerifyEmailViewModel>(
        () => _i38.VerifyEmailViewModel(gh<_i37.VerifyCodeUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i39.RegisterModule {}

