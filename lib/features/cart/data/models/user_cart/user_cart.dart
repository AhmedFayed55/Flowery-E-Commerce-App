import 'package:flowers_ecommerce_app/features/cart/domin/entities/user_cart.dart';

import 'cart.dart';

class UserCartDto {
  String? message;
  int? numOfCartItems;
  CartDto? cart;

  UserCartDto({this.message, this.numOfCartItems, this.cart});

  factory UserCartDto.fromJson(Map<String, dynamic> json) => UserCartDto(
    message: json['message'] as String?,
    numOfCartItems: json['numOfCartItems'] as int?,
    cart: json['cart'] == null
        ? null
        : CartDto.fromJson(json['cart'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'numOfCartItems': numOfCartItems,
    'cart': cart?.toJson(),
  };

  UserCart toEntity() {
    return UserCart(
      message: message!,
      numOfCartItems: numOfCartItems!,
      cart: cart!.toEntity(),
    );
  }
}
