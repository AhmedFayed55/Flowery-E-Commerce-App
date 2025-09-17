import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/cart/data/data_sources/cart_remote_data_sourse.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/delete_cart_item_respone/delete_cart_item_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_cart_prouduct_quantity_body.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_proudact_quantity_respone/updeate_proudact_quantity_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/user_cart/user_cart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSourse)
class CartRemoteDataSourseImpl implements CartRemoteDataSourse {
  ApiServices apiServices;

  CartRemoteDataSourseImpl(this.apiServices);

  @override
  Future<DeleteCartItemRespone> deleteCartProudct(String id) async {
    return await apiServices.deleteCartProudct(id);
  }

  @override
  Future<UserCartDto> getUserCart() async {
    return await apiServices.getUserCart();
  }

  @override
  Future<UpdeateProudactQuantityRespone> updeateCartProudctQuantity(
    String id,
    UpdeateCartProuductQuantityBody body,
  ) async {
    return await apiServices.updeateCartProudctQuantity(id, body);
  }
}
