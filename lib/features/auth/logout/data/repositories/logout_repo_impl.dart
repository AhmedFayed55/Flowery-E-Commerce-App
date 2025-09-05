import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/entities/logout_response_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/repositories/logout_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/api_results.dart';
import '../../../../../core/errors/failures.dart';
import '../data_sources/logout_ds.dart';

@Injectable(as: LogoutRepo)
class LogoutRepoImpl implements LogoutRepo {
  final LogoutDataSource _dataSource;

  LogoutRepoImpl(this._dataSource);

  @override
  Future<ApiResult<LogoutResponseEntity>> logout() async {
    try {
      final dtoResponse = await _dataSource.logout();

      return ApiSuccessResult<LogoutResponseEntity>(
        data: dtoResponse.toLogoutResponseEntity(),
      );
    } on DioException catch (e) {
      return ApiErrorResult<LogoutResponseEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<LogoutResponseEntity>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }
}
