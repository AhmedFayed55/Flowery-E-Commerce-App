import 'package:flowers_ecommerce_app/features/cart/data/models/user_cart/cart.dart';

class UpdeateProudactQuantityRespone {
  String? message;
  int? numOfCartItems;
  CartDto? cart;

  UpdeateProudactQuantityRespone({
    this.message,
    this.numOfCartItems,
    this.cart,
  });

  factory UpdeateProudactQuantityRespone.fromJson(Map<String, dynamic> json) {
    return UpdeateProudactQuantityRespone(
      message: json['message'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      cart: json['cart'] == null
          ? null
          : CartDto.fromJson(json['cart'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'numOfCartItems': numOfCartItems,
    'cart': cart?.toJson(),
  };
}
