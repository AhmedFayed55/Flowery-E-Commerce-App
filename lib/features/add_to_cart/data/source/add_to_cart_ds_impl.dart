import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_body.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_respone.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/source/add_to_cart_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : AddToCartDS)
class AddToCartDsImpl implements AddToCartDS {
  final ApiServices _apiServices;
  AddToCartDsImpl(this._apiServices);

  @override
  Future<AddProductRespone> addProductToCart(AddProductBody addProductBody) async{
    return await _apiServices.addToCart(addProductBody);
  }
}