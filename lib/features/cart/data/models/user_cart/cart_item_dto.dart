import 'package:flowers_ecommerce_app/features/cart/domin/entities/cart_item.dart';

import 'product.dart';

class CartItemDto {
  ProductDto? product;
  int? price;
  int? quantity;
  String? id;

  CartItemDto({this.product, this.price, this.quantity, this.id});

  factory CartItemDto.fromJson(Map<String, dynamic> json) => CartItemDto(
    product: json['product'] == null
        ? null
        : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
    price: json['price'] as int?,
    quantity: json['quantity'] as int?,
    id: json['_id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'product': product?.toJson(),
    'price': price,
    'quantity': quantity,
    '_id': id,
  };

  CartItem toEntity() {
    return CartItem(
      product: product?.toEntity(),
      price: price,
      quantity: quantity,
      id: id,
    );
  }
}
