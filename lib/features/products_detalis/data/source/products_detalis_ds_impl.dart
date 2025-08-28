

import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/model/get_specific_product_respone/get_specific_product_respone.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/source/products_detalis_ds.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductsDetalisDs)
class ProductsDetalisDsImpl implements ProductsDetalisDs {
  final ApiServices _apiServices ;

  ProductsDetalisDsImpl(this._apiServices);
  @override
  Future<GetSpecificProductRespone> getSpecificProduct(String productId) async{
    return await _apiServices.getSpecificProduct(productId);
  }
}