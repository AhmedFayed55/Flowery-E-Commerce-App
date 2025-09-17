import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/cart/data/data_sources/cart_remote_data_sourse_impl.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/delete_cart_item_respone/delete_cart_item_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_cart_prouduct_quantity_body.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_proudact_quantity_respone/updeate_proudact_quantity_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/user_cart/user_cart.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/user_cart/cart.dart';

@GenerateMocks([ApiServices])
import 'cart_remote_data_sourse_impl_test.mocks.dart';

void main() {
  late MockApiServices mockApiServices;
  late CartRemoteDataSourseImpl dataSource;

  setUp(() {
    mockApiServices = MockApiServices();
    dataSource = CartRemoteDataSourseImpl(mockApiServices);
  });

  group('CartRemoteDataSourseImpl with Mockito', () {
    const cartId = "123";

    group('deleteCartProudct', () {
      test(
        'should return DeleteCartItemRespone when ApiServices succeeds',
        () async {
          // arrange
          final cart = CartDto(
            id: "cart_1",
            user: "user_1",
            cartItems: [],
            totalPrice: 250,
          );

          final mockResponse = DeleteCartItemRespone(
            message: "Deleted successfully",
            numOfCartItems: 1,
            cart: cart,
          );

          when(
            mockApiServices.deleteCartProudct(cartId),
          ).thenAnswer((_) async => mockResponse);

          // act
          final result = await dataSource.deleteCartProudct(cartId);

          // assert
          expect(result.message, "Deleted successfully");
          expect(result.numOfCartItems, 1);
          expect(result.cart?.id, "cart_1");
          verify(mockApiServices.deleteCartProudct(cartId)).called(1);
        },
      );

      test('should throw Exception when ApiServices fails', () async {
        // arrange
        when(
          mockApiServices.deleteCartProudct(cartId),
        ).thenThrow(Exception("delete failed"));

        // act
        final call = dataSource.deleteCartProudct;

        // assert
        expect(() => call(cartId), throwsException);
        verify(mockApiServices.deleteCartProudct(cartId)).called(1);
      });
    });

    group('getUserCart', () {
      test('should return UserCartDto when ApiServices succeeds', () async {
        // arrange
        final mockResponse = UserCartDto(
          message: "success",
          cart: CartDto(
            id: "cart_1",
            user: "user_1",
            cartItems: [],
            totalPrice: 250,
          ),
        );

        when(
          mockApiServices.getUserCart(),
        ).thenAnswer((_) async => mockResponse);

        // act
        final result = await dataSource.getUserCart();

        // assert
        expect(result.message, "success");
        expect(result.cart?.id, "cart_1");
        verify(mockApiServices.getUserCart()).called(1);
      });

      test('should throw Exception when ApiServices fails', () async {
        // arrange
        when(
          mockApiServices.getUserCart(),
        ).thenThrow(Exception("get cart failed"));

        // act
        final call = dataSource.getUserCart;

        // assert
        expect(() => call(), throwsException);
        verify(mockApiServices.getUserCart()).called(1);
      });
    });

    group('updeateCartProudctQuantity', () {
      test(
        'should return UpdeateProudactQuantityRespone when ApiServices succeeds',
        () async {
          // arrange
          final body = UpdeateCartProuductQuantityBody(quantity: 5);
          final mockResponse = UpdeateProudactQuantityRespone(
            message: "updated",
            numOfCartItems: 1,
          );

          when(
            mockApiServices.updeateCartProudctQuantity(cartId, body),
          ).thenAnswer((_) async => mockResponse);

          // act
          final result = await dataSource.updeateCartProudctQuantity(
            cartId,
            body,
          );

          // assert
          expect(result.message, "updated");
          expect(result.numOfCartItems, 1);
          verify(
            mockApiServices.updeateCartProudctQuantity(cartId, body),
          ).called(1);
        },
      );

      test('should throw Exception when ApiServices fails', () async {
        // arrange
        final body = UpdeateCartProuductQuantityBody(quantity: 5);
        when(
          mockApiServices.updeateCartProudctQuantity(cartId, body),
        ).thenThrow(Exception("update failed"));

        // act
        Future<UpdeateProudactQuantityRespone> call() =>
            dataSource.updeateCartProudctQuantity(cartId, body);

        // assert
        expect(call, throwsException);
        verify(
          mockApiServices.updeateCartProudctQuantity(cartId, body),
        ).called(1);
      });
    });
  });
}
