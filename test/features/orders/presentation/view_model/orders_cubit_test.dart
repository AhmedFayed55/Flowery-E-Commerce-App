import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/entites/order.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/usecase/get_user_orders_usecase.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/view_model/cubit/orders_cubit.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/view_model/cubit/orders_event.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/view_model/cubit/orders_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'orders_cubit_test.mocks.dart';

@GenerateMocks([GetUserOrdersUsecase])
void main() {
  late OrdersCubit ordersCubit;
  late MockGetUserOrdersUsecase mockGetUserOrdersUsecase;

  setUp(() {
    mockGetUserOrdersUsecase = MockGetUserOrdersUsecase();
    ordersCubit = OrdersCubit(mockGetUserOrdersUsecase);
  });

  setUpAll(() {
    provideDummy<ApiResult<List<OrderEntity>>>(
      ApiSuccessResult<List<OrderEntity>>(data: []),
    );
  });
  group("OrdersCubit Tests", () {
    final orders = [
      OrderEntity(id: "1", state: "pending", orderItems: []),
      OrderEntity(id: "2", state: "completed", orderItems: []),
    ];

    blocTest<OrdersCubit, OrdersState>(
      'emits [loading, success] when GetUserOrdersUsecase returns success',
      build: () {
        when(mockGetUserOrdersUsecase.invoke()).thenAnswer(
          (_) async => ApiSuccessResult<List<OrderEntity>>(data: orders),
        );
        return ordersCubit;
      },
      act: (cubit) => cubit.doIntent(GetOrdersEvent()),
      expect: () => [
        const OrdersState(isLoading: true),
        OrdersState(
          isLoading: false,
          isSuccess: true,
          allOrders: orders,
          pendingOrders: [orders.first],
          completedOrders: [orders.last],
        ),
      ],
      verify: (_) {
        verify(mockGetUserOrdersUsecase.invoke()).called(1);
      },
    );

    blocTest<OrdersCubit, OrdersState>(
      'emits [loading, failure] when GetUserOrdersUsecase returns error',
      build: () {
        when(mockGetUserOrdersUsecase.invoke()).thenAnswer(
          (_) async => ApiErrorResult<List<OrderEntity>>(
            failure: Failure(errorMessage: "Server error"),
          ),
        );
        return ordersCubit;
      },
      act: (cubit) => cubit.doIntent(GetOrdersEvent()),
      expect: () => [
        const OrdersState(isLoading: true),
        const OrdersState(
          isLoading: false,
          isFailure: true,
          errorMessage: "Server error",
        ),
      ],
      verify: (_) {
        verify(mockGetUserOrdersUsecase.invoke()).called(1);
      },
    );
  });
}
