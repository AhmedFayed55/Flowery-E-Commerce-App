import 'package:flowers_ecommerce_app/features/orders/domin/entites/order.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/pages/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
        child: OrderCard(orderItem: orders[index]),
      ),
      itemCount: orders.length,
    );
  }
}
