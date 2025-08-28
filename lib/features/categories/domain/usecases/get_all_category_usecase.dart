import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/repository/get_all_category.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoryUseCase {
  GetAllCategoryRepositoryContract getAllCategoryRepositoryContract;

  GetAllCategoryUseCase({required this.getAllCategoryRepositoryContract});

  Future<ApiResult<List<CategoryModel>>> call() async {
    ApiResult<List<CategoryModel>> result =
        await getAllCategoryRepositoryContract.getAllCategory();
    return result;
  }
}
