import 'package:flowers_ecommerce_app/features/orders/domin/entites/product.dart';

class OrderItem {
  Product? product;
  int? price;
  int? quantity;
  String? id;
  
  OrderItem({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

}