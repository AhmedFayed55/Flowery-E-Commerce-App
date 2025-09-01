import 'package:flowers_ecommerce_app/features/cart/domin/entities/product.dart';

class CartItem {
  Product? product;
  int? price;
  int? quantity;
  String? id;

  CartItem({this.product, this.price, this.quantity, this.id});
}
