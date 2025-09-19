import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_body.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_respone.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/source/add_to_cart_ds.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/domin/repo/add_to_cart_repo.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/repo/add_to_cart_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'add_to_cart_repo_impl_test.mocks.dart';

@GenerateMocks([AddToCartDS, InternetConnectionChecker])
void main() {
  late AddToCartRepo repo;
  late MockAddToCartDS mockDS;
  late MockInternetConnectionChecker mockChecker;

  setUp(() {
    mockDS = MockAddToCartDS();
    mockChecker = MockInternetConnectionChecker();
    repo = AddToCartRepoImpl(mockDS, mockChecker);
  });

  group('AddToCartRepoImpl', () {
    final addProductBody = AddProductBody(product: '1', quantity: 1);
    final response = AddProductRespone(message: 'Added', numOfCartItems: 1);

    test('returns ApiErrorResult when no internet connection', () async {
      when(mockChecker.hasConnection).thenAnswer((_) async => false);

      final result = await repo.addProductToCart(addProductBody);

      expect(result, isA<ApiErrorResult<AddProductRespone>>());
      final error = (result as ApiErrorResult<AddProductRespone>).failure;
      expect(error.errorMessage, 'No Internet Connection');
      verifyNever(mockDS.addProductToCart(any));
    });

    test('returns ApiSuccessResult when request succeeds', () async {
      when(mockChecker.hasConnection).thenAnswer((_) async => true);
      when(
        mockDS.addProductToCart(addProductBody),
      ).thenAnswer((_) async => response);

      final result = await repo.addProductToCart(addProductBody);

      expect(result, isA<ApiSuccessResult<AddProductRespone>>());
      final data = (result as ApiSuccessResult<AddProductRespone>).data;
      expect(data.numOfCartItems, 1);
      expect(data.message, 'Added');
      verify(mockDS.addProductToCart(addProductBody)).called(1);
    });

    test('returns ApiErrorResult when DioException thrown', () async {
      when(mockChecker.hasConnection).thenAnswer((_) async => true);
      when(mockDS.addProductToCart(addProductBody)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: {'error': 'Server Error'},
          ),
        ),
      );

      final result = await repo.addProductToCart(addProductBody);

      expect(result, isA<ApiErrorResult<AddProductRespone>>());
      final error = (result as ApiErrorResult<AddProductRespone>).failure;
      expect(error.errorMessage, 'Server Error');
    });

    test('returns ApiErrorResult when generic exception thrown', () async {
      when(mockChecker.hasConnection).thenAnswer((_) async => true);
      when(
        mockDS.addProductToCart(addProductBody),
      ).thenThrow(Exception('Unknown Error'));

      final result = await repo.addProductToCart(addProductBody);

      expect(result, isA<ApiErrorResult<AddProductRespone>>());
      final error = (result as ApiErrorResult<AddProductRespone>).failure;
      expect(error.errorMessage.contains('Exception'), true);
    });
  });
}
