import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_body.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_respone.dart';

abstract interface class AddToCartDS {
  Future<AddProductRespone> addProductToCart(AddProductBody addProductBody);
}
