import 'package:flowers_ecommerce_app/features/cart/domin/usecase/updeate_cart_product_quantity_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_cart_prouduct_quantity_body.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_proudact_quantity_respone/updeate_proudact_quantity_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/repo/cart_repo.dart';

@GenerateMocks([CartRepo])
import 'updeate_cart_product_quantity_usecase_test.mocks.dart';

void main() {
  late MockCartRepo mockCartRepo;
  late UpdeateCartProductQuantityUsecase usecase;

  setUpAll(() {
    provideDummy<ApiResult<UpdeateProudactQuantityRespone>>(
      ApiSuccessResult(
        data: UpdeateProudactQuantityRespone(
          message: "updated",
          numOfCartItems: 1,
        ),
      ),
    );
    provideDummy<ApiResult<UpdeateProudactQuantityRespone>>(
      ApiErrorResult(
        failure: Failure(errorMessage: ""),
      ),
    );
  });

  setUp(() {
    mockCartRepo = MockCartRepo();
    usecase = UpdeateCartProductQuantityUsecase(mockCartRepo);
  });

  group('UpdeateCartProductQuantityUsecase', () {
    const cartId = "123";
    final body = UpdeateCartProuductQuantityBody(quantity: 5);

    test('should return ApiSuccessResult when repo call is successful', () async {
      // arrange
      final mockResponse = UpdeateProudactQuantityRespone(
        message: "updated",
        numOfCartItems: 2,
      );

      when(mockCartRepo.updeateCartProudctQuantity(cartId, body))
          .thenAnswer((_) async => ApiSuccessResult(data: mockResponse));

      // act
      final result = await usecase.invok(cartId, body);

      // assert
      expect(result, isA<ApiSuccessResult<UpdeateProudactQuantityRespone>>());
      final success = result as ApiSuccessResult<UpdeateProudactQuantityRespone>;
      expect(success.data.message, "updated");
      expect(success.data.numOfCartItems, 2);
      verify(mockCartRepo.updeateCartProudctQuantity(cartId, body)).called(1);
    });

    test('should return ApiErrorResult when repo call fails', () async {
      // arrange
      final failure = Failure(errorMessage: "Something went wrong");

      when(mockCartRepo.updeateCartProudctQuantity(cartId, body))
          .thenAnswer((_) async => ApiErrorResult(failure: failure));

      // act
      final result = await usecase.invok(cartId, body);

      // assert
      expect(result, isA<ApiErrorResult<UpdeateProudactQuantityRespone>>());
      final error = result as ApiErrorResult<UpdeateProudactQuantityRespone>;
      expect(error.failure.errorMessage, "Something went wrong");
      verify(mockCartRepo.updeateCartProudctQuantity(cartId, body)).called(1);
    });
  });
}
