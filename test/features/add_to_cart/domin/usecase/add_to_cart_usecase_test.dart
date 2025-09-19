import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_body.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_respone.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/domin/repo/add_to_cart_repo.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/domin/usecase/add_to_cart_usecase.dart';

import 'add_to_cart_usecase_test.mocks.dart';

@GenerateMocks([AddToCartRepo])
void main() {
  late AddToCartUsecase usecase;
  late MockAddToCartRepo mockRepo;

  setUp(() {
    mockRepo = MockAddToCartRepo();
    usecase = AddToCartUsecase(mockRepo);
    provideDummy<ApiResult<AddProductRespone>>(
      ApiSuccessResult(data: AddProductRespone(message: '', numOfCartItems: 0)),
    );
  });

  group('AddToCartUsecase', () {
    final body = AddProductBody(product: '1', quantity: 1);
    final response = AddProductRespone(message: 'Added', numOfCartItems: 1);

    test('returns ApiSuccessResult when repo returns success', () async {
      // arrange
      when(
        mockRepo.addProductToCart(body),
      ).thenAnswer((_) async => ApiSuccessResult(data: response));

      // act
      final result = await usecase.invoke(body);

      // assert
      expect(result, isA<ApiSuccessResult<AddProductRespone>>());
      final data = (result as ApiSuccessResult<AddProductRespone>).data;
      expect(data.message, 'Added');
      expect(data.numOfCartItems, 1);
      verify(mockRepo.addProductToCart(body)).called(1);
    });

    test('returns ApiErrorResult when repo returns error', () async {
      // arrange
      when(mockRepo.addProductToCart(body)).thenAnswer(
        (_) async => ApiErrorResult<AddProductRespone>(
          failure: Failure(errorMessage: 'error occurred'),
        ),
      );

      // act
      final result = await usecase.invoke(body);

      // assert
      expect(result, isA<ApiErrorResult<AddProductRespone>>());
      final error = (result as ApiErrorResult<AddProductRespone>).failure;
      expect(error.errorMessage, 'error occurred');
      verify(mockRepo.addProductToCart(body)).called(1);
    });
  });
}
