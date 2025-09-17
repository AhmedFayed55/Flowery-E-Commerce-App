import 'package:flowers_ecommerce_app/features/cart/domin/usecase/delete_cart_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/delete_cart_item_respone/delete_cart_item_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/repo/cart_repo.dart';

@GenerateMocks([CartRepo])
import 'delete_cart_usecase_test.mocks.dart';

void main() {
  late MockCartRepo mockCartRepo;
  late DeleteCartUsecase usecase;

  setUp(() {
    mockCartRepo = MockCartRepo();
    usecase = DeleteCartUsecase(mockCartRepo);
  });

  group('DeleteCartUsecase', () {
    const cartId = "123";

    test(
      'should return ApiSuccessResult when repo call is successful',
      () async {
        // arrange
        final mockResponse = DeleteCartItemRespone(
          message: "Deleted successfully",
          numOfCartItems: 1,
        );

        provideDummy<ApiResult<DeleteCartItemRespone>>(
          ApiSuccessResult(data: mockResponse),
        );

        when(
          mockCartRepo.deleteCartProudct(cartId),
        ).thenAnswer((_) async => ApiSuccessResult(data: mockResponse));

        // act
        final result = await usecase.invok(cartId);

        // assert
        expect(result, isA<ApiSuccessResult<DeleteCartItemRespone>>());
        final success = result as ApiSuccessResult<DeleteCartItemRespone>;
        expect(success.data.message, "Deleted successfully");
        expect(success.data.numOfCartItems, 1);
        verify(mockCartRepo.deleteCartProudct(cartId)).called(1);
      },
    );

    test('should return ApiErrorResult when repo call fails', () async {
      // arrange
      final failure = Failure(errorMessage: "Something went wrong");

      provideDummy<ApiResult<DeleteCartItemRespone>>(
        ApiErrorResult(failure: failure),
      );

      when(
        mockCartRepo.deleteCartProudct(cartId),
      ).thenAnswer((_) async => ApiErrorResult(failure: failure));

      // act
      final result = await usecase.invok(cartId);

      // assert
      expect(result, isA<ApiErrorResult<DeleteCartItemRespone>>());
      final error = result as ApiErrorResult<DeleteCartItemRespone>;
      expect(error.failure.errorMessage, "Something went wrong");
      verify(mockCartRepo.deleteCartProudct(cartId)).called(1);
    });
  });
}
