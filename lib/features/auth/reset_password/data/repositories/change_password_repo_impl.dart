import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/data/models/mapper/change_password_request_maper.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_response_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/repositories/change_password_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/api_results.dart';
import '../../../../../core/errors/failures.dart';
import '../data_sources/change_password_ds.dart';

@Injectable(as: ChangePasswordRepo)
class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ChangePasswordDataSource _dataSource;
  ChangePasswordRepoImpl(this._dataSource);

  @override
  Future<ApiResult<ChangePasswordResponseEntity>> changePassword(
    ChangePasswordRequestEntity request,
  ) async {
    try {
      final requestDto = toChangePasswordRequestDto(request);
      final response = await _dataSource.changePassword(requestDto);

      return ApiSuccessResult(data: response.toChangePasswordResponseEntityEntity());
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
