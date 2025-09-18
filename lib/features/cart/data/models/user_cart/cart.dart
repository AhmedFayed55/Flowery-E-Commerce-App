import 'package:flowers_ecommerce_app/features/cart/domin/entities/cart.dart';

import 'cart_item_dto.dart';

class CartDto {
  String? id;
  String? user;
  List<CartItemDto>? cartItems;
  List<dynamic>? appliedCoupons;
  int? totalPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CartDto({
    this.id,
    this.user,
    this.cartItems,
    this.appliedCoupons,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) => CartDto(
    id: json['_id'] as String?,
    user: json['user'] as String?,
    cartItems: (json['cartItems'] as List<dynamic>?)
        ?.map((e) => CartItemDto.fromJson(e as Map<String, dynamic>))
        .toList(),
    appliedCoupons: json['appliedCoupons'] as List<dynamic>?,
    totalPrice: json['totalPrice'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'user': user,
    'DtoItems': cartItems?.map((e) => e.toJson()).toList(),
    'appliedCoupons': appliedCoupons,
    'totalPrice': totalPrice,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
  };

  Cart toEntity() {
    return Cart(
      id: id,
      user: user,
      cartItems: cartItems?.map((e) => e.toEntity()).toList(),
      appliedCoupons: appliedCoupons,
      totalPrice: totalPrice,
    );
  }
}
