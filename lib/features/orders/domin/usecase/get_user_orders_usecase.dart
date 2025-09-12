import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/entites/order.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/repo/orders_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserOrdersUsecase {
  final OrdersRepo ordersRepo;
  GetUserOrdersUsecase({required this.ordersRepo});

  Future<ApiResult<List<OrderEntity>>> invoke() => ordersRepo.getUserOrders();
}