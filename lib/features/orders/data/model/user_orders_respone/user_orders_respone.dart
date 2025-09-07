import 'metadata.dart';
import 'order_dto.dart';

class UserOrdersRespone {
  String? message;
  Metadata? metadata;
  List<OrderDto>? orders;

  UserOrdersRespone({this.message, this.metadata, this.orders});

  factory UserOrdersRespone.fromJson(Map<String, dynamic> json) {
    return UserOrdersRespone(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'metadata': metadata?.toJson(),
    'orders': orders?.map((e) => e.toJson()).toList(),
  };
}
