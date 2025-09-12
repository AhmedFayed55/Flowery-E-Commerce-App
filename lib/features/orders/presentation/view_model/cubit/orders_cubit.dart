import 'package:bloc/bloc.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/entites/order.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/usecase/get_user_orders_usecase.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/view_model/cubit/orders_event.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/view_model/cubit/orders_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  GetUserOrdersUsecase getUserOrdersUsecase;

  OrdersCubit(this.getUserOrdersUsecase) : super(const OrdersState());

  void doIntent(OrdersEvent event) {
    switch (event) {
      case GetOrdersEvent():
        _getUserOrders();
    }
  }

  Future<void> _getUserOrders() async {
    emit(state.copyWith(isLoading: true));
    final result = await getUserOrdersUsecase.invoke();
    switch (result) {
      case ApiSuccessResult<List<OrderEntity>>():
        final pending = result.data.where((o) => o.state == "pending").toList();
        final completed = result.data
            .where((o) => o.state == "completed")
            .toList();
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            allOrders: result.data,
            pendingOrders: pending,
            completedOrders: completed,
          ),
        );
        break;
      case ApiErrorResult<List<OrderEntity>>():
        emit(
          state.copyWith(
            isLoading: false,
            isFailure: true,
            errorMessage: result.failure.errorMessage,
          ),
        );
        break;
    }
  }
}
