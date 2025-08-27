import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/usecase/get_specific_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/entites/product_entity.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/repo/products_detalis_repo.dart';

import 'get_specific_product_usecase_test.mocks.dart';

@GenerateMocks([ProductsDetalisRepo])
void main() {
  group('GetSpecificProductUsecase', () {
    late MockProductsDetalisRepo mockRepo;
    late GetSpecificProductUsecase usecase;

    const productId = "123";
    final product = ProductEntity(
      id: productId,
      title: "test",
      description: "desc",
      price: 10,
      quantity: 1,
      images: ["img"],
      priceAfterDiscount: 8,
    );

    setUp(() {
      mockRepo = MockProductsDetalisRepo();
      usecase = GetSpecificProductUsecase(mockRepo);
    });

    provideDummy<ApiResult<ProductEntity>>(ApiSuccessResult(data: product));

    test(
      'when calling invoke with valid data should return ApiSuccessResult',
      () async {
        final expected = ApiSuccessResult<ProductEntity>(data: product);
        // Arrange
        when(
          mockRepo.getProductsDetalis(productId),
        ).thenAnswer((_) async => expected);

        // Act
        final result = await usecase.invok(productId);

        // Assert
        verify(mockRepo.getProductsDetalis(productId)).called(1);
        expect(result, isA<ApiSuccessResult<ProductEntity>>());
        expect((result as ApiSuccessResult).data.id, equals(productId));
      },
    );

    test(
      'when calling invoke with invalid data should return ApiErrorResult',
      () async {
        // Arrange
        final expected = ApiErrorResult<ProductEntity>(
          failure: Failure(errorMessage: "Not Found"),
        );

        provideDummy<ApiErrorResult<ProductEntity>>(expected);
        when(
          mockRepo.getProductsDetalis(productId),
        ).thenAnswer((_) async => expected);

        // Act
        final result = await usecase.invok(productId);

        // Assert
        verify(mockRepo.getProductsDetalis(productId)).called(1);
        expect(result, isA<ApiErrorResult<ProductEntity>>());
        expect(
          (result as ApiErrorResult).failure.errorMessage,
          equals("Not Found"),
        );
      },
    );
  });
}
