import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/orders/data/model/user_orders_respone/order_dto.dart';
import 'package:flowers_ecommerce_app/features/orders/data/model/user_orders_respone/user_orders_respone.dart';
import 'package:flowers_ecommerce_app/features/orders/data/source/orders_remote_ds.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/entites/order.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowers_ecommerce_app/features/orders/data/repo/order_repo_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'order_repo_impl_test.mocks.dart';

@GenerateMocks([OrdersRemoteDataSource, InternetConnectionChecker])
void main() {
  late OrdersRemoteDataSource ordersRemoteDataSource;
  late InternetConnectionChecker internetConnectionChecker;
  late OrderRepoImpl orderRepoImpl;

  setUpAll(() {
    ordersRemoteDataSource = MockOrdersRemoteDataSource();
    internetConnectionChecker = MockInternetConnectionChecker();
    orderRepoImpl = OrderRepoImpl(
     ordersRemoteDataSource,
      internetConnectionChecker,
    );
  });
  group('order_repo_impl_test', () {
    test(
      'when call getOrders should and success then return ApiSuccessResult',
      () async {
        // arrange
        when(
          internetConnectionChecker.hasConnection,
        ).thenAnswer((_) async => true);
        // var mockSuccessResult = ApiSuccessResult<List<OrderEntity>>(data: []);
        List<OrderDto> orders = [];
        UserOrdersRespone mockGetUserOrders = UserOrdersRespone(
          message: 'success',
          metadata: null,
          orders: orders,
        );

        when(
          ordersRemoteDataSource.getUserOrders(),
        ).thenAnswer((_) async => mockGetUserOrders);

        // act
        var result = await orderRepoImpl.getUserOrders();
            
        // assert
        expect(result, isA<ApiSuccessResult<List<OrderEntity>>>());
        verify(ordersRemoteDataSource.getUserOrders()).called(1);
      },
    );
    test('when call getOrders should and fail then return ApiErrorResult', () async {
      // arrange
      when(
        internetConnectionChecker.hasConnection,
      ).thenAnswer((_) async => true);
      when(
        ordersRemoteDataSource.getUserOrders(),
      ).thenThrow(Exception( 
        "failed",
      ));
      // act
      var result = await orderRepoImpl.getUserOrders();
      // assert
      expect(result, isA<ApiErrorResult<List<OrderEntity>>>());
      verify(ordersRemoteDataSource.getUserOrders()).called(1);
    }); 
      

  test('when call getOrders with no internet should fail then return ApiErrorResult', () async {
    // arrange
    when(
      internetConnectionChecker.hasConnection,
    ).thenAnswer((_) async => false);
    // act
    var result = await orderRepoImpl.getUserOrders();
    result as ApiErrorResult<List<OrderEntity>>;
    // assert
    expect(result, isA<ApiErrorResult<List<OrderEntity>>>());
    expect(result.failure.errorMessage, equals(AppConstants.noInternet));
    verifyNever(ordersRemoteDataSource.getUserOrders());
  });
  });
}
