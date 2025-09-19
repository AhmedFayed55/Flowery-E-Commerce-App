import 'package:flowers_ecommerce_app/features/orders/domin/entites/order.dart';

import 'order_item_dto.dart';

class OrderDto {
  String? id;
  String? user;
  List<OrderItemDto>? orderItems;
  int? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? orderNumber;
  int? v;

  OrderDto({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) => OrderDto(
    id: json['_id'] as String?,
    user: json['user'] as String?,
    orderItems: (json['orderItems'] as List<dynamic>?)
        ?.map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPrice: json['totalPrice'] as int?,
    paymentType: json['paymentType'] as String?,
    isPaid: json['isPaid'] as bool?,
    isDelivered: json['isDelivered'] as bool?,
    state: json['state'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    orderNumber: json['orderNumber'] as String?,
    v: json['__v'] as int?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'user': user,
    'orderItems': orderItems?.map((e) => e.toJson()).toList(),
    'totalPrice': totalPrice,
    'paymentType': paymentType,
    'isPaid': isPaid,
    'isDelivered': isDelivered,
    'state': state,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'orderNumber': orderNumber,
    '__v': v,
  };

  OrderEntity toEntity() => OrderEntity(
    id: id,
    user: user,
    orderItems: orderItems?.map((e) => e.toEntity()).toList(),
    totalPrice: totalPrice,
    paymentType: paymentType,
    isPaid: isPaid,
    isDelivered: isDelivered,
    state: state,
    createdAt: createdAt,
    updatedAt: updatedAt,
    orderNumber: orderNumber,
    v: v,
  );
}
