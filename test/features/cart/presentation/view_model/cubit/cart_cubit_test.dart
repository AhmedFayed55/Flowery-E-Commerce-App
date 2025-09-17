import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/delete_cart_item_respone/delete_cart_item_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_proudact_quantity_respone/updeate_proudact_quantity_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/cart.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/cart_item.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/product.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/user_cart.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/usecase/delete_cart_usecase.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/usecase/get_user_carts_usecase.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/usecase/updeate_cart_product_quantity_usecase.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/view_model/cubit/cart_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_cubit_test.mocks.dart';

@GenerateMocks([
  GetUserCartsUsecase,
  DeleteCartUsecase,
  UpdeateCartProductQuantityUsecase,
])
void main() {
  late MockGetUserCartsUsecase mockGetUserCartsUsecase;
  late MockDeleteCartUsecase mockDeleteCartUsecase;
  late MockUpdeateCartProductQuantityUsecase
  mockUpdateCartProductQuantityUsecase;

  late UserCart testUserCart;

  setUp(() {
    mockGetUserCartsUsecase = MockGetUserCartsUsecase();
    mockDeleteCartUsecase = MockDeleteCartUsecase();
    mockUpdateCartProductQuantityUsecase =
        MockUpdeateCartProductQuantityUsecase();

    // إعداد بيانات userCart للتست
    testUserCart = UserCart(
      message: "success",
      numOfCartItems: 1,
      cart: Cart(
        totalPrice: 100,
        cartItems: [
          CartItem(
            quantity: 2,
            product: Product(
              id: "1",
              title: "test",
              price: 100,
              imgCover: "test",
              category: "test",
              occasion: "test",
            ),
          ),
        ],
      ),
    );

    // ندي Mockito dummy values
    provideDummy<ApiResult<UserCart>>(ApiSuccessResult(data: testUserCart));
    provideDummy<ApiResult<DeleteCartItemRespone>>(
      ApiSuccessResult(data: DeleteCartItemRespone(message: "deleted")),
    );
    provideDummy<ApiResult<UpdeateProudactQuantityRespone>>(
      ApiSuccessResult(
        data: UpdeateProudactQuantityRespone(message: "updated"),
      ),
    );
  });

  group("CartCubit Tests", () {
    blocTest<CartCubit, CartState>(
      'should emit [loading, success] when getUserCartsUsecase returns success',
      build: () {
        when(
          mockGetUserCartsUsecase.invok(),
        ).thenAnswer((_) async => ApiSuccessResult(data: testUserCart));
        return CartCubit(
          mockGetUserCartsUsecase,
          mockDeleteCartUsecase,
          mockUpdateCartProductQuantityUsecase,
        );
      },
      act: (cubit) => cubit.doIntent(const LoadUserCartEvent()),
      expect: () => [
        isA<CartState>().having((s) => s.isLoading, "loading", true),
        isA<CartState>().having((s) => s.userCart, "userCart", testUserCart),
      ],
    );

    blocTest<CartCubit, CartState>(
      'should emit [loading, error] when getUserCartsUsecase returns failure',
      build: () {
        when(mockGetUserCartsUsecase.invok()).thenAnswer(
          (_) async => ApiErrorResult<UserCart>(
            failure: Failure(errorMessage: "failed"),
          ),
        );
        return CartCubit(
          mockGetUserCartsUsecase,
          mockDeleteCartUsecase,
          mockUpdateCartProductQuantityUsecase,
        );
      },
      act: (cubit) => cubit.doIntent(const LoadUserCartEvent()),
      expect: () => [
        isA<CartState>().having((s) => s.isLoading, "loading", true),
        isA<CartState>().having((s) => s.errorMessage, "error", "failed"),
      ],
    );

    blocTest<CartCubit, CartState>(
      'should emit [cartLoading, cartRemoved] when deleteCartUsecase returns success',
      build: () {
        when(mockDeleteCartUsecase.invok("123")).thenAnswer(
          (_) async =>
              ApiSuccessResult(data: DeleteCartItemRespone(message: "deleted")),
        );
        final cubit = CartCubit(
          mockGetUserCartsUsecase,
          mockDeleteCartUsecase,
          mockUpdateCartProductQuantityUsecase,
        );
        cubit.emit(cubit.state.copyWith(userCart: testUserCart));
        return cubit;
      },
      act: (cubit) => cubit.doIntent(const DeleteCartItemEvent("123")),
      expect: () => [
        isA<CartState>().having((s) => s.isCartLoading, "loading", true),
        isA<CartState>().having((s) => s.isCartRemoved, "removed", true),
      ],
    );

    blocTest<CartCubit, CartState>(
      'should emit [quantityUpdatedLoading, quantityUpdated] when updateCartProductQuantityUsecase returns success',
      build: () {
        when(mockUpdateCartProductQuantityUsecase.invok("123", any)).thenAnswer(
          (_) async => ApiSuccessResult(
            data: UpdeateProudactQuantityRespone(message: "updated"),
          ),
        );

        final cubit = CartCubit(
          mockGetUserCartsUsecase,
          mockDeleteCartUsecase,
          mockUpdateCartProductQuantityUsecase,
        );

        // inject userCart يحتوي على cartId = 123
        cubit.emit(
          cubit.state.copyWith(
            userCart: UserCart(
              message: "success",
              numOfCartItems: 1,
              cart: Cart(
                totalPrice: 100,
                cartItems: [
                  CartItem(quantity: 2, product: Product(id: "123", price: 50)),
                ],
              ),
            ),
          ),
        );
        return cubit;
      },
      act: (cubit) =>
          cubit.doIntent(const UpdeateCartItemQuantityEvent("123", 3)),
      expect: () => [
        isA<CartState>().having(
          (s) => s.isCartQuantityUpdatedLoading,
          "loading",
          true,
        ),
        isA<CartState>().having(
          (s) => s.isCartQuantityUpdated,
          "updated",
          true,
        ),
      ],
    );
  });
}
