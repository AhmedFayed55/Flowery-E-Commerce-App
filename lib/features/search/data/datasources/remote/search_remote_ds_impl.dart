import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/search/data/datasources/remote/search_remote_ds.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/search_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiServices apiServices;

  SearchRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ApiResult<SearchResponseEntity>> search(String keyword) async {
    try {
      var responseResult = await apiServices.search(keyword);
      var entityResult = responseResult.toEntity();
      return ApiSuccessResult<SearchResponseEntity>(data: entityResult);
    } on DioException catch (e) {
      return ApiErrorResult<SearchResponseEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<SearchResponseEntity>(
        failure: Failure(errorMessage: "Error ==> ${e.toString()}"),
      );
    }
  }
}
