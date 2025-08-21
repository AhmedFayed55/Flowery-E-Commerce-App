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
    return this;
  }
}

class _$DatabaseModule extends _i664.DatabaseModule {}

class _$DioModule extends _i614.DioModule {}
