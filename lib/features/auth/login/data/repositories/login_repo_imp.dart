import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/services/token_service.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/data_sources/login_ds.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/mappers/login_mapper.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/login_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/repositories/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImp implements LoginRepo {
  final LoginDataSource _loginDataSource;
  LoginRepoImp(this._loginDataSource);
  @override
  Future<ApiResult<UserLoginEntity>> loginRepo(
    LoginRequestEntity loginRequestEntity,
  ) async {
    try {
      final dto = toDto(loginRequestEntity);
      var responce = await _loginDataSource.login(dto);
      await getIt<TokenService>().saveToken(responce.token);
      return ApiSuccessResult(data: responce.user.toDomain());
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
