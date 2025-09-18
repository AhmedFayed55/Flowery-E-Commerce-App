import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/entites/order.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/repo/orders_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/usecase/get_user_orders_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_orders_usecase_test.mocks.dart';

@GenerateMocks([OrdersRepo])
void main() {
  late GetUserOrdersUsecase getUserOrdersUsecase;
  late OrdersRepo ordersRepo;

  setUp(() {
    ordersRepo = MockOrdersRepo();
    getUserOrdersUsecase = GetUserOrdersUsecase(ordersRepo: ordersRepo);
    provideDummy<ApiResult<List<OrderEntity>>>(
      ApiSuccessResult<List<OrderEntity>>(data: []),
    );
  });
  group('get_user_orders_usecase_test', () {
    test(
      'when call invoke should and success then return ApiSuccessResult',
      () async {
        // arrange
        var mockSuccessResult = ApiSuccessResult<List<OrderEntity>>(data: []);
        when(
          ordersRepo.getUserOrders(),
        ).thenAnswer((_) async => mockSuccessResult);

        // act
        var result = await getUserOrdersUsecase.invoke();
        // assert
        expect(result, mockSuccessResult);
        verify(ordersRepo.getUserOrders()).called(1);
      },
    );
    test(
      'when call invoke and repo failure then return ApiErrorResult',
      () async {
        // arrange
        final mockFailureResult = ApiErrorResult<List<OrderEntity>>(
          failure: Failure(errorMessage: "Server error"),
        );

        when(
          ordersRepo.getUserOrders(),
        ).thenAnswer((_) async => mockFailureResult);

        // act
        final result = await getUserOrdersUsecase.invoke();

        // assert
        expect(result, isA<ApiErrorResult<List<OrderEntity>>>());
        expect((result as ApiErrorResult).failure.errorMessage, "Server error");
        verify(ordersRepo.getUserOrders()).called(1);
        verifyNoMoreInteractions(ordersRepo);
      },
    );
  });
}
