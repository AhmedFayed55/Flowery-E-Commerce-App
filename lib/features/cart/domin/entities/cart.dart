import 'package:flowers_ecommerce_app/features/cart/domin/entities/cart_item.dart';

class Cart {
  String? id;
  String? user;
  List<CartItem>? cartItems;
  List<dynamic>? appliedCoupons;
  int? totalPrice;

  Cart({
    this.id,
    this.user,
    this.cartItems,
    this.appliedCoupons,
    this.totalPrice,
  });
  
}