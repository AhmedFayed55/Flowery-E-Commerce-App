import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/entites/order.dart';

abstract interface class OrdersRepo {
  Future<ApiResult<List<OrderEntity>>> getUserOrders();
}
