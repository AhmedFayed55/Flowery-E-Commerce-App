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

import '../../features/auth/register/data/repo/auth_repo_impl.dart' as _i990;
import '../../features/auth/register/data/source/auth_remote_data_sourse.dart'
    as _i637;
import '../../features/auth/register/data/source/auth_remote_data_sourse_imlp.dart'
    as _i30;
import '../../features/auth/register/domin/repo/auth_repo.dart' as _i975;
import '../../features/auth/register/domin/usecase/register_usecase.dart'
    as _i752;
import '../../features/auth/register/presentation/view_model/cubit/register_cubit.dart'
    as _i444;
import '../../features/products_detalis/data/repo/products_detalis_repo_impl.dart'
    as _i505;
import '../../features/products_detalis/data/source/products_detalis_ds.dart'
    as _i25;
import '../../features/products_detalis/data/source/products_detalis_ds_impl.dart'
    as _i247;
import '../../features/products_detalis/domin/repo/products_detalis_repo.dart'
    as _i329;
import '../../features/products_detalis/domin/usecase/get_specific_product_usecase.dart'
    as _i838;
import '../../features/products_detalis/presentation/view_model/cubit/product_details_cubit.dart'
    as _i680;
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
    gh.factory<_i637.AuthRemoteDataSource>(
      () => _i30.AuthRemoteDataSourseImlp(gh<_i804.ApiServices>()),
    );
    gh.factory<_i975.AuthRepo>(
      () => _i990.AuthRepoImpl(gh<_i637.AuthRemoteDataSource>()),
    );
    gh.factory<_i25.ProductsDetalisDs>(
      () => _i247.ProductsDetalisDsImpl(gh<_i804.ApiServices>()),
    );
    gh.factory<_i329.ProductsDetalisRepo>(
      () => _i505.ProductsDetalisRepoImpl(gh<_i25.ProductsDetalisDs>()),
    );
    gh.factory<_i752.RegisterUsecase>(
      () => _i752.RegisterUsecase(authRepo: gh<_i975.AuthRepo>()),
    );
    gh.factory<_i444.RegisterCubit>(
      () => _i444.RegisterCubit(gh<_i752.RegisterUsecase>()),
    );
    gh.factory<_i838.GetSpecificProductUsecase>(
      () => _i838.GetSpecificProductUsecase(gh<_i329.ProductsDetalisRepo>()),
    );
    gh.factory<_i680.ProductsDetalis>(
      () => _i680.ProductsDetalis(gh<_i838.GetSpecificProductUsecase>()),
    );
    return this;
  }
}

class _$DatabaseModule extends _i664.DatabaseModule {}

class _$DioModule extends _i614.DioModule {}
