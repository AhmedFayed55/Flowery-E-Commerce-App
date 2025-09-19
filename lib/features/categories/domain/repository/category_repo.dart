import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';

abstract class GetAllCategoryRepositoryContract {
  Future<ApiResult<List<CategoryModel>>> getAllCategory();
}
