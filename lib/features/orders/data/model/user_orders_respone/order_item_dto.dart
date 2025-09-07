import 'package:flowers_ecommerce_app/features/orders/domin/entites/order_item.dart';

import 'product_dto.dart';

class OrderItemDto {
  ProductDto? product;
  int? price;
  int? quantity;
  String? id;

  OrderItemDto({this.product, this.price, this.quantity, this.id});

  factory OrderItemDto.fromJson(Map<String, dynamic> json) => OrderItemDto(
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


  OrderItem toEntity() => OrderItem(
    product: product?.toEntity(),
    price: price,
    quantity: quantity,
    id: id,
  );
}
