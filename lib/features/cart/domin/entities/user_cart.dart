import 'package:flowers_ecommerce_app/features/cart/domin/entities/cart.dart';

class UserCart {
  final String message;
  final int numOfCartItems;
  final Cart cart;

  UserCart({
    required this.message,
    required this.numOfCartItems,
    required this.cart,
  });
}