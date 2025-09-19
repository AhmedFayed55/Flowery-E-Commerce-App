import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/model/get_specific_product_respone/get_specific_product_respone.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/model/get_specific_product_respone/product_dto.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/source/products_detalis_ds_impl.dart';

import 'products_detalis_ds_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  group('getSpecificProduct', () {
    late MockApiServices mockApiServices;
    late ProductsDetalisDsImpl productsDetalisDsImpl;

    const productId = "123";

    final productDto = ProductDto(
      id: productId,
      title: "test",
      slug: "test-slug",
      description: "desc",
      imgCover: "cover.png",
      images: ["img1.png"],
      price: 10,
      priceAfterDiscount: 8,
      quantity: 5,
      category: "cat",
      occasion: "occasion",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      v: 1,
      isSuperAdmin: false,
      sold: 0,
      rateAvg: 4,
      rateCount: 2,
    );

    final response = GetSpecificProductRespone(
      product: productDto,
      message: "success",
    );

    setUp(() {
      mockApiServices = MockApiServices();
      productsDetalisDsImpl = ProductsDetalisDsImpl(mockApiServices);
    });

    test(
      'when calling getSpecificProduct with valid data should return GetSpecificProductRespone',
      () async {
        // Arrange
        when(
          mockApiServices.getSpecificProduct(productId),
        ).thenAnswer((_) async => response);

        // Act
        final result = await productsDetalisDsImpl.getSpecificProduct(
          productId,
        );

        // Assert
        verify(mockApiServices.getSpecificProduct(productId)).called(1);
        expect(result, equals(response));
        expect(result.product!.id, equals(productId));
        expect(result.message, equals("success"));
      },
    );

    test(
      ' when calling getSpecificProduct with invalid data should throw Exception',
      () async {
        // Arrange
        when(
          mockApiServices.getSpecificProduct(productId),
        ).thenThrow(Exception("API error"));

        // Act
        Future<GetSpecificProductRespone> call() =>
            productsDetalisDsImpl.getSpecificProduct(productId);

        // Assert
        expect(call, throwsA(isA<Exception>()));
        verify(mockApiServices.getSpecificProduct(productId)).called(1);
      },
    );
  });
}
