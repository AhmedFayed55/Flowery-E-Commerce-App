
import 'package:flowers_ecommerce_app/features/products_detalis/data/model/get_specific_product_respone/get_specific_product_respone.dart';

abstract interface class ProductsDetalisDs {

  Future<GetSpecificProductRespone> getSpecificProduct(String productId);
}
