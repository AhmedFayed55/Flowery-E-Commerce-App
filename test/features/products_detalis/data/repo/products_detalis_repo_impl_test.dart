import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/model/get_specific_product_respone/get_specific_product_respone.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/model/get_specific_product_respone/product_dto.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/source/products_detalis_ds.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/entites/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/repo/products_detalis_repo_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'products_detalis_repo_impl_test.mocks.dart';

@GenerateMocks([ProductsDetalisDs])
void main() {
  group('ProductsDetalisRepoImpl', () {
    late MockProductsDetalisDs mockProductsDetalisDs;
    late ProductsDetalisRepoImpl productsDetalisRepoImpl;

    const productId = "673e2e1f1159920171828153";

    final proudct = ProductEntity(
      id: productId,
      title: "test",
      description: "test",
      price: 1,
      quantity: 1,
      images: ["test"],
      priceAfterDiscount: 1,
    );

    final productDto = ProductDto(
      id: productId,
      title: "test",
      slug: "test",
      description: "test",
      imgCover: "test",
      images: ["test"],
      price: 1,
      priceAfterDiscount: 1,
      quantity: 1,
      category: "test",
      occasion: "test",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      v: 1,
      isSuperAdmin: true,
      sold: 1,
      rateAvg: 1,
      rateCount: 1,
    );

    late GetSpecificProductRespone getSpecificProductRespone;

    setUp(() {
      mockProductsDetalisDs = MockProductsDetalisDs();
      productsDetalisRepoImpl = ProductsDetalisRepoImpl(mockProductsDetalisDs);

      getSpecificProductRespone =
          GetSpecificProductRespone(product: productDto, message: "test");
    });

    test(
      'when calling getProductDetalis should return ApiSuccessResult<ProductEntity>',
      () async {
        // Arrange
        when(mockProductsDetalisDs.getSpecificProduct(productId))
            .thenAnswer((_) async => getSpecificProductRespone);

        // Act
        final result = await productsDetalisRepoImpl.getProductsDetalis(productId);

        // Assert
        verify(mockProductsDetalisDs.getSpecificProduct(productId)).called(1);
        expect(result, isA<ApiSuccessResult<ProductEntity>>());
        expect((result as ApiSuccessResult).data.id, equals(proudct.id));
      },
    );

    test(
      'when DioException thrown should return ApiErrorResult',
      () async {
        // Arrange
        when(mockProductsDetalisDs.getSpecificProduct(productId))
            .thenThrow(DioException(
          requestOptions: RequestOptions(path: ""),
          response: Response(
            requestOptions: RequestOptions(path: ""),
            data: {"message": "Dio error"},
            statusCode: 400,
          ),
        ));

        // Act
        final result = await productsDetalisRepoImpl.getProductsDetalis(productId);

        // Assert
        expect(result, isA<ApiErrorResult>());
        expect((result as ApiErrorResult).failure.errorMessage, equals("Dio error"));
      },
    );

    test(
      'when generic Exception thrown should return ApiErrorResult',
      () async {
        // Arrange
        when(mockProductsDetalisDs.getSpecificProduct(productId))
            .thenThrow(Exception("Something went wrong"));

        // Act
        final result = await productsDetalisRepoImpl.getProductsDetalis(productId);

        // Assert
        expect(result, isA<ApiErrorResult>());
        expect((result as ApiErrorResult).failure.errorMessage,
            contains("Something went wrong"));
      },
    );
  });
}
