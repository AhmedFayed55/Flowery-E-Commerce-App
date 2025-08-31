// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/forget_password/datasource/datasources/remote/email_verify_remote_datasource.dart'
    as _i45;
import '../../features/auth/forget_password/datasource/datasources/remote/email_verify_remote_datasource_impl.dart'
    as _i950;
import '../../features/auth/forget_password/datasource/datasources/remote/forget_pass_remote_datasource.dart'
    as _i197;
import '../../features/auth/forget_password/datasource/datasources/remote/forget_pass_remote_datasource_impl.dart'
    as _i990;
import '../../features/auth/forget_password/datasource/datasources/remote/reset_pass_remote_datasource.dart'
    as _i217;
import '../../features/auth/forget_password/datasource/datasources/remote/reset_pass_remote_datasource_impl.dart'
    as _i398;
import '../../features/auth/forget_password/datasource/repository_impl/email_verify_repo_impl.dart'
    as _i865;
import '../../features/auth/forget_password/datasource/repository_impl/forget_pass_repo_impl.dart'
    as _i791;
import '../../features/auth/forget_password/datasource/repository_impl/reset_pass_repo_impl.dart'
    as _i592;
import '../../features/auth/forget_password/domain/repository/email_verify_repo_contract.dart'
    as _i209;
import '../../features/auth/forget_password/domain/repository/forget_pass_repo_contract.dart'
    as _i171;
import '../../features/auth/forget_password/domain/repository/reset_pass_repo_contract.dart'
    as _i735;
import '../../features/auth/forget_password/domain/usecases/email_verify_usecase.dart'
    as _i532;
import '../../features/auth/forget_password/domain/usecases/forget_pass_usecase.dart'
    as _i107;
import '../../features/auth/forget_password/domain/usecases/reset_pass_usecase.dart'
    as _i801;
import '../../features/auth/forget_password/presentation/cubit/forget_pass_cubit.dart'
    as _i648;
import '../helpers/shared_pref.dart' as _i42;
import '../network/api_services.dart' as _i804;
import '../network/dio_module.dart' as _i614;
import '../services/token_service.dart' as _i227;
import 'modules/database_module.dart' as _i664;
import 'modules/token_interceptor.dart' as _i89;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final databaseModule = _$DatabaseModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => databaseModule.providesharedPreferences,
      preResolve: true,
    );
    gh.factory<_i89.TokenInterceptor>(() => _i89.TokenInterceptor());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => databaseModule.flutterSecureStorage(),
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.factory<_i804.ApiServices>(() => _i804.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i227.TokenService>(
      () => _i227.TokenService(
        prefs: gh<_i558.FlutterSecureStorage>(),
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i42.SharedPrefHelper>(
      () => _i42.SharedPrefHelper(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i197.ForgetPasswordRemoteDataSource>(
      () => _i990.ForgetPasswordRemoteDataSourceImpl(
        apiServices: gh<_i804.ApiServices>(),
      ),
    );
    gh.factory<_i45.EmailVerifyRemoteDataSource>(
      () => _i950.EmailVerifyRemoteDataSourceImpl(
        apiServices: gh<_i804.ApiServices>(),
      ),
    );
    gh.factory<_i217.ResetPasswordRemoteDataSource>(
      () => _i398.ResetPasswordRemoteDataSourceImpl(
        apiServices: gh<_i804.ApiServices>(),
      ),
    );
    gh.factory<_i209.EmailVerifyRepoContract>(
      () => _i865.EmailVerifyRepoImpl(
        emailVerifyRemoteDataSource: gh<_i45.EmailVerifyRemoteDataSource>(),
      ),
    );
    gh.factory<_i171.ForgetPasswordRepoContract>(
      () => _i791.ForgetPasswordRepoImpl(
        forgetPasswordRemoteDataSource:
            gh<_i197.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i532.EmailVerifyUseCase>(
      () => _i532.EmailVerifyUseCase(
        emailVerifyRepoContract: gh<_i209.EmailVerifyRepoContract>(),
      ),
    );
    gh.factory<_i107.ForgetPasswordUseCase>(
      () => _i107.ForgetPasswordUseCase(
        forgetPasswordRepoContract: gh<_i171.ForgetPasswordRepoContract>(),
      ),
    );
    gh.factory<_i735.ResetPasswordRepoContract>(
      () => _i592.ResetPasswordRepoImpl(
        resetPasswordRemoteDataSource:
            gh<_i217.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i801.ResetPasswordUseCase>(
      () => _i801.ResetPasswordUseCase(
        resetPasswordRepoContract: gh<_i735.ResetPasswordRepoContract>(),
      ),
    );
    gh.factory<_i648.ForgetPasswordCubit>(
      () => _i648.ForgetPasswordCubit(
        forgetPasswordUseCase: gh<_i107.ForgetPasswordUseCase>(),
        emailVerifyUseCase: gh<_i532.EmailVerifyUseCase>(),
        resetPasswordUseCase: gh<_i801.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$DatabaseModule extends _i664.DatabaseModule {}

class _$DioModule extends _i614.DioModule {}
