import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/orders/data/model/user_orders_respone/user_orders_respone.dart';
import 'package:flowers_ecommerce_app/features/orders/data/source/orders_remote_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final ApiServices _apiServices;

  OrdersRemoteDataSourceImpl(this._apiServices);

  @override
  Future<UserOrdersRespone> getUserOrders() async {
    return await _apiServices.getUserOrders();
  }
}
