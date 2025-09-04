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
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
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
import '../../features/auth/login/data/data_sources/login_ds.dart' as _i773;
import '../../features/auth/login/data/data_sources/login_ds_imp.dart' as _i265;
import '../../features/auth/login/data/repositories/login_repo_imp.dart'
    as _i408;
import '../../features/auth/login/domain/repositories/login_repo.dart' as _i172;
import '../../features/auth/login/domain/use_case/login_use_case.dart' as _i630;
import '../../features/auth/login/domain/view_model/login_bloc.dart' as _i580;
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
import '../../features/cart/data/data_sources/cart_remote_data_sourse.dart'
    as _i1046;
import '../../features/cart/data/data_sources/cart_remote_data_sourse_impl.dart'
    as _i84;
import '../../features/cart/data/repo/cart_repo_impl.dart' as _i234;
import '../../features/cart/domin/repo/cart_repo.dart' as _i1047;
import '../../features/cart/domin/usecase/delete_cart_usecase.dart' as _i664;
import '../../features/cart/domin/usecase/get_user_carts_usecase.dart'
    as _i1043;
import '../../features/cart/domin/usecase/updeate_cart_product_quantity_usecase.dart'
    as _i177;
import '../../features/cart/presentation/view_model/cubit/cart_cubit.dart'
    as _i323;
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
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => dioModule.connectionChecker,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.factory<_i804.ApiServices>(() => _i804.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i773.LoginDataSource>(
      () => _i265.LoginDataSourceImp(gh<_i804.ApiServices>()),
    );
    gh.factory<_i227.TokenService>(
      () => _i227.TokenService(
        prefs: gh<_i558.FlutterSecureStorage>(),
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i42.SharedPrefHelper>(
      () => _i42.SharedPrefHelper(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i1046.CartRemoteDataSourse>(
      () => _i84.CartRemoteDataSourseImpl(gh<_i804.ApiServices>()),
    );
    gh.factory<_i172.LoginRepo>(
      () => _i408.LoginRepoImp(gh<_i773.LoginDataSource>()),
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
    gh.factory<_i637.AuthRemoteDataSource>(
      () => _i30.AuthRemoteDataSourseImlp(gh<_i804.ApiServices>()),
    );
    gh.factory<_i975.AuthRepo>(
      () => _i990.AuthRepoImpl(gh<_i637.AuthRemoteDataSource>()),
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
    gh.factory<_i630.LoginUseCase>(
      () => _i630.LoginUseCase(gh<_i172.LoginRepo>()),
    );
    gh.factory<_i1047.CartRepo>(
      () => _i234.CartRepoImpl(
        gh<_i1046.CartRemoteDataSourse>(),
        gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.factory<_i580.LoginBloc>(
      () => _i580.LoginBloc(gh<_i630.LoginUseCase>()),
    );
    gh.factory<_i752.RegisterUsecase>(
      () => _i752.RegisterUsecase(authRepo: gh<_i975.AuthRepo>()),
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
    gh.factory<_i664.DeleteCartUsecase>(
      () => _i664.DeleteCartUsecase(gh<_i1047.CartRepo>()),
    );
    gh.factory<_i1043.GetUserCartsUsecase>(
      () => _i1043.GetUserCartsUsecase(gh<_i1047.CartRepo>()),
    );
    gh.factory<_i177.UpdeateCartProductQuantityUsecase>(
      () => _i177.UpdeateCartProductQuantityUsecase(gh<_i1047.CartRepo>()),
    );
    gh.factory<_i801.ResetPasswordUseCase>(
      () => _i801.ResetPasswordUseCase(
        resetPasswordRepoContract: gh<_i735.ResetPasswordRepoContract>(),
      ),
    );
    gh.factory<_i323.CartCubit>(
      () => _i323.CartCubit(
        gh<_i1043.GetUserCartsUsecase>(),
        gh<_i664.DeleteCartUsecase>(),
        gh<_i177.UpdeateCartProductQuantityUsecase>(),
      ),
    );
    gh.factory<_i444.RegisterCubit>(
      () => _i444.RegisterCubit(gh<_i752.RegisterUsecase>()),
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
