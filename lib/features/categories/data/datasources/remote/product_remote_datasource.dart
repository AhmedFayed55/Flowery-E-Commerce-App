import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/product_response_entity.dart';

abstract class GetAllProductsRemoteDatasource {
  Future<ApiResult<ProductResponseEntity>> getAllProducts(String? sortBy);
}
