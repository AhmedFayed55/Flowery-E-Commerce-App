import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/categories/data/models/response/category_response.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';
import 'package:injectable/injectable.dart';

import 'get_all_category_remote_datasource.dart';

@Injectable(as: GetAllCategoryRemoteDatasource)
class GetAllCategoryRemoteDatasourceImpl
    implements GetAllCategoryRemoteDatasource {
  ApiServices apiServices;

  GetAllCategoryRemoteDatasourceImpl({required this.apiServices});

  @override
  Future<ApiResult<List<CategoryModel>>> getAllCategory() async {
    try {
      CategoryResponse response = await apiServices.getAllCategory();
      List<CategoryModel>? categoryModel = response.categories
          ?.map((categoriesDTO) => categoriesDTO.toCategoryModel())
          .toList();
      return ApiSuccessResult(data: categoryModel ?? []);
    } on DioException catch (dioError) {
      return ApiErrorResult(
        failure: Failure(errorMessage: dioError.message ?? ""),
      );
    } catch (error) {
      return ApiErrorResult(failure: Failure(errorMessage: error.toString()));
    }
  }
}
