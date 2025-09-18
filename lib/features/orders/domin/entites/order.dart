import 'package:flowers_ecommerce_app/features/orders/domin/entites/order_item.dart';

class OrderEntity {
  String? id;
  String? user;
  List<OrderItem>? orderItems;
  int? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? orderNumber;
  int? v;

  OrderEntity({
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
}
