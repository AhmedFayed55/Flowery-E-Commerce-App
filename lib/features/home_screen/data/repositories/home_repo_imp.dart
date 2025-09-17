import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/data_sources/home_ds.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/home_entity.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

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
