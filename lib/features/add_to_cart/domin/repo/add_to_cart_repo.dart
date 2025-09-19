import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_body.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_respone.dart';

abstract interface class AddToCartRepo {
  Future<ApiResult<AddProductRespone>> addProductToCart(
    AddProductBody addProductBody,
  );
}
