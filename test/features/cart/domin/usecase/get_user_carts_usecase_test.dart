import 'package:flowers_ecommerce_app/features/cart/domin/entities/cart.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/usecase/get_user_carts_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/user_cart.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/repo/cart_repo.dart';

@GenerateMocks([CartRepo])
import 'get_user_carts_usecase_test.mocks.dart';

void main() {
  late MockCartRepo mockCartRepo;
  late GetUserCartsUsecase usecase;

  setUpAll(() {
    provideDummy<ApiResult<UserCart>>(
      ApiSuccessResult(
        data: UserCart(message: 'success', numOfCartItems: 1, cart: Cart(
          id: "1",
          cartItems: [],
          totalPrice: 100
        )
          
        ),
      ),
    );
    provideDummy<ApiResult<UserCart>>(
      ApiErrorResult(
        failure: Failure(errorMessage: ""),
      ),
    );
  });

  setUp(() {
    mockCartRepo = MockCartRepo();
    usecase = GetUserCartsUsecase(mockCartRepo);
  });

  group('GetUserCartsUsecase', () {
    test('should return ApiSuccessResult when repo call is successful', () async {
      // arrange
      final mockUserCart = UserCart(
        message: "success",
        numOfCartItems: 1,
        cart: Cart(id: "1", cartItems: [], totalPrice: 100),
      );

      when(mockCartRepo.getUserCart())
          .thenAnswer((_) async => ApiSuccessResult(data: mockUserCart));

      // act
      final result = await usecase.invok();

      // assert
      expect(result, isA<ApiSuccessResult<UserCart>>());
      final success = result as ApiSuccessResult<UserCart>;
      expect(success.data.cart.id, "1");
      expect(success.data.cart.totalPrice, 100);
      expect(success.data.cart.cartItems, isEmpty);
      verify(mockCartRepo.getUserCart()).called(1);
    });

    test('should return ApiErrorResult when repo call fails', () async {
      // arrange
      final failure = Failure(errorMessage: "Server error");

      when(mockCartRepo.getUserCart())
          .thenAnswer((_) async => ApiErrorResult(failure: failure));

      // act
      final result = await usecase.invok();

      // assert
      expect(result, isA<ApiErrorResult<UserCart>>());
      final error = result as ApiErrorResult<UserCart>;
      expect(error.failure.errorMessage, "Server error");
      verify(mockCartRepo.getUserCart()).called(1);
    });
  });
}
