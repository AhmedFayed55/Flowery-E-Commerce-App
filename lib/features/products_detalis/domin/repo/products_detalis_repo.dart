import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/entites/product_entity.dart';

abstract interface class ProductsDetalisRepo {
  Future<ApiResult<ProductEntity>> getProductsDetalis(String id);
}
