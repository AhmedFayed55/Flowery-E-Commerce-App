import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/orders/data/source/orders_remote_ds.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/entites/order.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/repo/orders_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: OrdersRepo)
class OrderRepoImpl implements OrdersRepo {
  final OrdersRemoteDataSource _ordersRemoteDataSource;
  final InternetConnectionChecker _internetConnectionChecker;

  OrderRepoImpl(this._ordersRemoteDataSource, this._internetConnectionChecker);

  @override
  Future<ApiResult<List<OrderEntity>>> getUserOrders() async {
    final bool isConnected = await _internetConnectionChecker.hasConnection;
    if (!isConnected) {
      return ApiErrorResult(
        failure: Failure(errorMessage: AppConstants.noInternet),
      );
    }

    try {
      var respone = await _ordersRemoteDataSource.getUserOrders();
      return ApiSuccessResult(
        data: respone.orders!.map((e) => e.toEntity()).toList(),
      );
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: Failure(errorMessage: e.response!.data[AppConstants.error]),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
