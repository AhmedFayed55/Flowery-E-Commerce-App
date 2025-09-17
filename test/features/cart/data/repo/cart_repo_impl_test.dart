import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/features/cart/data/repo/cart_repo_impl.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/user_cart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/cart/data/data_sources/cart_remote_data_sourse.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/delete_cart_item_respone/delete_cart_item_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_cart_prouduct_quantity_body.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_proudact_quantity_respone/updeate_proudact_quantity_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/user_cart/cart.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/user_cart/user_cart.dart';

import 'cart_repo_impl_test.mocks.dart';

@GenerateMocks([CartRemoteDataSourse, InternetConnectionChecker])
void main() {
  late MockCartRemoteDataSourse mockRemoteDataSource;
  late MockInternetConnectionChecker mockConnectionChecker;
  late CartRepoImpl repo;

  setUp(() {
    mockRemoteDataSource = MockCartRemoteDataSourse();
    mockConnectionChecker = MockInternetConnectionChecker();
    repo = CartRepoImpl(mockRemoteDataSource, mockConnectionChecker);
  });

  group('CartRepoImpl', () {
    const cartId = "123";

    group('deleteCartProudct', () {
      test(
        'should return ApiSuccessResult when remote call succeeds',
        () async {
          // arrange
          when(
            mockConnectionChecker.hasConnection,
          ).thenAnswer((_) async => true);

          final mockResponse = DeleteCartItemRespone(
            message: "Deleted",
            numOfCartItems: 1,
            cart: CartDto(id: "c1", user: "u1", cartItems: [], totalPrice: 100),
          );
          when(
            mockRemoteDataSource.deleteCartProudct(cartId),
          ).thenAnswer((_) async => mockResponse);

          // act
          final result = await repo.deleteCartProudct(cartId);

          // assert
          expect(result, isA<ApiSuccessResult<DeleteCartItemRespone>>());
          expect((result as ApiSuccessResult).data.message, "Deleted");
        },
      );

      test('should return ApiErrorResult when no internet', () async {
        when(
          mockConnectionChecker.hasConnection,
        ).thenAnswer((_) async => false);

        final result = await repo.deleteCartProudct(cartId);

        expect(result, isA<ApiErrorResult>());
        expect(
          (result as ApiErrorResult).failure.errorMessage,
          AppConstants.noInternet,
        );
      });

      test('should return ApiErrorResult when DioException thrown', () async {
        when(mockConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockRemoteDataSource.deleteCartProudct(cartId)).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              requestOptions: RequestOptions(path: ''),
              data: {AppConstants.error: "server error"},
            ),
          ),
        );

        final result = await repo.deleteCartProudct(cartId);

        expect(result, isA<ApiErrorResult>());
        expect((result as ApiErrorResult).failure.errorMessage, "server error");
      });

      test(
        'should return ApiErrorResult when unexpected exception thrown',
        () async {
          when(
            mockConnectionChecker.hasConnection,
          ).thenAnswer((_) async => true);
          when(
            mockRemoteDataSource.deleteCartProudct(cartId),
          ).thenThrow(Exception("unexpected error"));

          final result = await repo.deleteCartProudct(cartId);

          expect(result, isA<ApiErrorResult>());
          expect(
            (result as ApiErrorResult).failure.errorMessage,
            contains("unexpected error"),
          );
        },
      );
    });

    group('getUserCart', () {
      test(
        'should return ApiSuccessResult when remote call succeeds',
        () async {
          when(
            mockConnectionChecker.hasConnection,
          ).thenAnswer((_) async => true);
          final mockResponse = UserCartDto(
            message: "message",
            numOfCartItems: 1,
            cart: CartDto(id: "c1", user: "u1", cartItems: [], totalPrice: 100),
          );
          when(
            mockRemoteDataSource.getUserCart(),
          ).thenAnswer((_) async => mockResponse);

          final result = await repo.getUserCart();

          expect(result, isA<ApiSuccessResult<UserCart>>());
          expect(
            (result as ApiSuccessResult<UserCart>).data.cart.totalPrice,
            100,
          );
        },
      );

      test('should return ApiErrorResult when no internet', () async {
        when(
          mockConnectionChecker.hasConnection,
        ).thenAnswer((_) async => false);

        final result = await repo.getUserCart();

        expect(result, isA<ApiErrorResult>());
        expect(
          (result as ApiErrorResult).failure.errorMessage,
          AppConstants.noInternet,
        );
      });
    });

    group('updeateCartProudctQuantity', () {
      test(
        'should return ApiSuccessResult when remote call succeeds',
        () async {
          when(
            mockConnectionChecker.hasConnection,
          ).thenAnswer((_) async => true);
          final body = UpdeateCartProuductQuantityBody(quantity: 5);
          final mockResponse = UpdeateProudactQuantityRespone(
            message: "updated",
            numOfCartItems: 2,
          );

          when(
            mockRemoteDataSource.updeateCartProudctQuantity(cartId, body),
          ).thenAnswer((_) async => mockResponse);

          final result = await repo.updeateCartProudctQuantity(cartId, body);

          expect(result, isA<ApiSuccessResult>());
          expect((result as ApiSuccessResult).data.message, "updated");
        },
      );

      test('should return ApiErrorResult when no internet', () async {
        when(
          mockConnectionChecker.hasConnection,
        ).thenAnswer((_) async => false);

        final result = await repo.updeateCartProudctQuantity(
          cartId,
          UpdeateCartProuductQuantityBody(quantity: 5),
        );

        expect(result, isA<ApiErrorResult>());
        expect(
          (result as ApiErrorResult).failure.errorMessage,
          AppConstants.noInternet,
        );
      });
    });
  });
}
