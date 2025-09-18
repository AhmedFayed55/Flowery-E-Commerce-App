import 'package:flowers_ecommerce_app/features/orders/data/model/user_orders_respone/user_orders_respone.dart';

abstract interface class OrdersRemoteDataSource {
  Future<UserOrdersRespone> getUserOrders();
}
