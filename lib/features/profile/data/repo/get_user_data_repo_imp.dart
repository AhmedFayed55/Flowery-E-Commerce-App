import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/profile/data/remot_data_source/get_user_data_ds.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/user_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/repo/get_user_data_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetUserDataRepo)
class GetUserDataRepoImp implements GetUserDataRepo {
  final GetUserDataDataSource _getUserDataDataSource;
  GetUserDataRepoImp(this._getUserDataDataSource);
  @override
  Future<ApiResult<UserProfileEntity>> getUserDataRepo() async {
    try {
      var response = await _getUserDataDataSource.getUserDataSource();
      return ApiSuccessResult(data: response.user.toDomain());
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
