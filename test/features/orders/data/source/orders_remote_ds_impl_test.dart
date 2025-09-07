import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/orders/data/model/user_orders_respone/user_orders_respone.dart';
import 'package:flowers_ecommerce_app/features/orders/data/source/orders_remote_ds.dart';
import 'package:flutter_test/flutter_test.dart'; 
import 'package:flowers_ecommerce_app/features/orders/data/source/orders_remote_ds_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../feature/forget_password/data/email_verify_remote_datasource_impl_test.mocks.dart';
	

@GenerateMocks([ApiServices])
void main() {
  late OrdersRemoteDataSource ordersRemoteDataSource;
  late ApiServices apiServices;

  setUpAll(() {
    apiServices = MockApiServices();
    ordersRemoteDataSource = OrdersRemoteDataSourceImpl(apiServices);
  });

	group(
		'orders_remote_ds_impl_test', 
		() {
			test(
				' when call getUserOrders should and success then return UserOrdersRespone',
				() async {
          // arrange
          UserOrdersRespone mockGetUserOrders = UserOrdersRespone(
            message: 'success',
            metadata: null,
            orders: [],
          );
          when(apiServices.getUserOrders()).thenAnswer((_) async => mockGetUserOrders);
          // act
          var result = await ordersRemoteDataSource.getUserOrders();
          // assert
          expect(result, mockGetUserOrders);
          verify(apiServices.getUserOrders()).called(1);
				},
			);

      test('when call getUserOrders should and fail then throw Exception', () async {
        // arrange
        when(apiServices.getUserOrders()).thenThrow(Exception());
        // act
        var result = ordersRemoteDataSource.getUserOrders();
        // assert
        expect(result, throwsA(isA<Exception>()));
      });
		},
	);
}
