import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_ds.dart';

@Injectable(as: HomeRepo)
class HomeRepoImp implements HomeRepo {
  final HomeDataSource _homeDataSource;
  HomeRepoImp(this._homeDataSource);
  @override
  Future<ApiResult<HomeEntity>> homeRepo() async {
    try {
      var responce = await _homeDataSource.homeDataSource();
      return ApiSuccessResult(data: responce.toDomain());
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
