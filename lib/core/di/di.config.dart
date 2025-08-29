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
import '../../features/categories/data/datasources/remote/category_remote_datasource.dart'
    as _i747;
import '../../features/categories/data/datasources/remote/category_remote_datasource_impl.dart'
    as _i337;
import '../../features/categories/data/datasources/remote/product_remote_datasource.dart'
    as _i295;
import '../../features/categories/data/datasources/remote/product_remote_datasource_impl.dart'
    as _i250;
import '../../features/categories/data/repository_impl/category_repo_impl.dart'
    as _i6;
import '../../features/categories/data/repository_impl/product_repo_impl.dart'
    as _i574;
import '../../features/categories/domain/repository/category_repo.dart'
    as _i124;
import '../../features/categories/domain/repository/product_repo.dart' as _i573;
import '../../features/categories/domain/usecases/category_usecase.dart'
    as _i710;
import '../../features/categories/domain/usecases/product_usecase.dart'
    as _i1006;
import '../../features/categories/presentation/cubit/category_cubit.dart'
    as _i93;
import '../../features/main_layout/tabs/home_screen/data/data_sources/home_ds.dart'
    as _i362;
import '../../features/main_layout/tabs/home_screen/data/data_sources/home_ds_imp.dart'
    as _i121;
import '../../features/main_layout/tabs/home_screen/data/repositories/home_repo_imp.dart'
    as _i146;
import '../../features/main_layout/tabs/home_screen/domain/repositories/home_repo.dart'
    as _i620;
import '../../features/main_layout/tabs/home_screen/domain/use_cases/home_use_case.dart'
    as _i738;
import '../../features/main_layout/tabs/home_screen/domain/view_model/home_bloc.dart'
    as _i847;
import '../../features/occasions/data/data_sources/occasions_ds.dart' as _i553;
import '../../features/occasions/data/data_sources/occasions_ds_impl.dart'
    as _i31;
import '../../features/occasions/data/repositories/occasions_repo_impl.dart'
    as _i156;
import '../../features/occasions/domain/repositories/occasions_repo.dart'
    as _i282;
import '../../features/occasions/domain/use_cases/get_specific_occasions_use_case.dart'
    as _i859;
import '../../features/occasions/presentation/manager/occasions_cubit.dart'
    as _i610;
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
import '../errors/internet_connection.dart' as _i339;
import '../helpers/shared_pref.dart' as _i42;
import '../network/api_services.dart' as _i804;
import '../network/external_modules.dart' as _i576;
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
    final externalModules = _$ExternalModules();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => databaseModule.providesharedPreferences,
      preResolve: true,
    );
    gh.factory<_i89.TokenInterceptor>(() => _i89.TokenInterceptor());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => databaseModule.flutterSecureStorage(),
    );
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => externalModules.connectionChecker,
    );
    gh.lazySingleton<_i361.Dio>(() => externalModules.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => externalModules.providePrettyDioLogger(),
    );
    gh.factory<_i804.ApiServices>(() => _i804.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i747.GetAllCategoryRemoteDatasource>(
      () => _i337.GetAllCategoryRemoteDatasourceImpl(
        apiServices: gh<_i804.ApiServices>(),
      ),
    );
    gh.factory<_i553.OccasionsDataSource>(
      () => _i31.OccasionsDataSourceImpl(gh<_i804.ApiServices>()),
    );
    gh.factory<_i773.LoginDataSource>(
      () => _i265.LoginDataSourceImp(gh<_i804.ApiServices>()),
    );
    gh.factory<_i227.TokenService>(
      () => _i227.TokenService(
        prefs: gh<_i558.FlutterSecureStorage>(),
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i124.GetAllCategoryRepositoryContract>(
      () => _i6.GetAllCategoryRepositoryImpl(
        getAllCategoryRemoteDatasource:
            gh<_i747.GetAllCategoryRemoteDatasource>(),
      ),
    );
    gh.factory<_i42.SharedPrefHelper>(
      () => _i42.SharedPrefHelper(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i339.NetworkConnection>(
      () => _i339.NetworkConnectionImpl(gh<_i973.InternetConnectionChecker>()),
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
    gh.factory<_i362.HomeDataSource>(
      () => _i121.HomeDataSourceImp(gh<_i804.ApiServices>()),
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
    gh.factory<_i25.ProductsDetalisDs>(
      () => _i247.ProductsDetalisDsImpl(gh<_i804.ApiServices>()),
    );
    gh.factory<_i171.ForgetPasswordRepoContract>(
      () => _i791.ForgetPasswordRepoImpl(
        forgetPasswordRemoteDataSource:
            gh<_i197.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i295.GetAllProductsRemoteDatasource>(
      () => _i250.GetAllProductsRemoteDatasourceImpl(
        apiServices: gh<_i804.ApiServices>(),
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
    gh.factory<_i573.GetAllProductsRepositoryContract>(
      () => _i574.GetAllProductsRepositoryImpl(
        getAllProductsRemoteDatasource:
            gh<_i295.GetAllProductsRemoteDatasource>(),
      ),
    );
    gh.factory<_i710.GetAllCategoryUseCase>(
      () => _i710.GetAllCategoryUseCase(
        getAllCategoryRepositoryContract:
            gh<_i124.GetAllCategoryRepositoryContract>(),
      ),
    );
    gh.factory<_i282.OccasionsRepository>(
      () => _i156.OccasionsRepositoryImpl(
        gh<_i553.OccasionsDataSource>(),
        gh<_i339.NetworkConnection>(),
      ),
    );
    gh.factory<_i859.GetSpecificOccasionsUseCase>(
      () => _i859.GetSpecificOccasionsUseCase(gh<_i282.OccasionsRepository>()),
    );
    gh.factory<_i580.LoginBloc>(
      () => _i580.LoginBloc(gh<_i630.LoginUseCase>()),
    );
    gh.factory<_i329.ProductsDetalisRepo>(
      () => _i505.ProductsDetalisRepoImpl(gh<_i25.ProductsDetalisDs>()),
    );
    gh.factory<_i752.RegisterUsecase>(
      () => _i752.RegisterUsecase(authRepo: gh<_i975.AuthRepo>()),
    );
    gh.factory<_i620.HomeRepo>(
      () => _i146.HomeRepoImp(gh<_i362.HomeDataSource>()),
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
    gh.factory<_i1006.GetAllProductsUseCase>(
      () => _i1006.GetAllProductsUseCase(
        getAllProductsRepositoryContract:
            gh<_i573.GetAllProductsRepositoryContract>(),
      ),
    );
    gh.factory<_i444.RegisterCubit>(
      () => _i444.RegisterCubit(gh<_i752.RegisterUsecase>()),
    );
    gh.factory<_i838.GetSpecificProductUsecase>(
      () => _i838.GetSpecificProductUsecase(gh<_i329.ProductsDetalisRepo>()),
    );
    gh.factory<_i648.ForgetPasswordCubit>(
      () => _i648.ForgetPasswordCubit(
        forgetPasswordUseCase: gh<_i107.ForgetPasswordUseCase>(),
        emailVerifyUseCase: gh<_i532.EmailVerifyUseCase>(),
        resetPasswordUseCase: gh<_i801.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i610.OccasionsCubit>(
      () => _i610.OccasionsCubit(gh<_i859.GetSpecificOccasionsUseCase>()),
    );
    gh.factory<_i738.HomeUseCase>(
      () => _i738.HomeUseCase(gh<_i620.HomeRepo>()),
    );
    gh.factory<_i680.ProductsDetalis>(
      () => _i680.ProductsDetalis(gh<_i838.GetSpecificProductUsecase>()),
    );
    gh.factory<_i847.HomeBloc>(() => _i847.HomeBloc(gh<_i738.HomeUseCase>()));
    gh.factory<_i93.CategoryCubit>(
      () => _i93.CategoryCubit(
        getAllCategoryUseCase: gh<_i710.GetAllCategoryUseCase>(),
        getAllProductsUseCase: gh<_i1006.GetAllProductsUseCase>(),
      ),
    );
    return this;
  }
}

class _$DatabaseModule extends _i664.DatabaseModule {}

class _$ExternalModules extends _i576.ExternalModules {}
