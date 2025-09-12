import 'package:flowers_ecommerce_app/features/cart/data/models/delete_cart_item_respone/delete_cart_item_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_cart_prouduct_quantity_body.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_proudact_quantity_respone/updeate_proudact_quantity_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/user_cart/user_cart.dart';

abstract interface class CartRemoteDataSourse {
  Future<UserCartDto> getUserCart();
  Future<UpdeateProudactQuantityRespone> updeateCartProudctQuantity(
    String id,
    UpdeateCartProuductQuantityBody body,
  );
  
  Future<DeleteCartItemRespone> deleteCartProudct(String id);
}
