import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/entites/product_entity.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/usecase/get_specific_product_usecase.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/presentation/view_model/cubit/product_details_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


@GenerateMocks([GetSpecificProductUsecase])
import 'product_details_cubit_test.mocks.dart';

void main() {
  late MockGetSpecificProductUsecase mockUsecase;
  late ProductsDetalis cubit;


  
    provideDummy<ApiResult<ProductEntity>>(
      ApiSuccessResult(data:  ProductEntity(id: '0', title: 'dummy', price: 0)),
    );


  setUp(() {
    mockUsecase = MockGetSpecificProductUsecase();
    cubit = ProductsDetalis(mockUsecase);
  });



  group('ProductsDetalisCubit', () {
    const tProductId = '123';
    final tProduct = ProductEntity(
      id: tProductId,
      price: 100,
      quantity: 1,
      title: 'test',
      description: 'test',
      images: ['test'],
      priceAfterDiscount: 100,
    );

    blocTest<ProductsDetalis, ProductDetailsState>(
      'emits [loading, success] when product fetched successfully',
      build: () {
        when(mockUsecase.invok(tProductId)).thenAnswer(
          (_) async => ApiSuccessResult(data: tProduct),
        );
        return cubit;
      },
      act: (cubit) => cubit.getSpecificProduct(tProductId),
      expect: () => [
        const ProductDetailsState(isLoading: true),
        ProductDetailsState(
          isLoading: false,
          isSuccess: true,
          product: tProduct,
        ),
      ],
    );

    blocTest<ProductsDetalis, ProductDetailsState>(
      'emits [loading, failure] when fetching product fails',
      build: () {
        when(mockUsecase.invok(tProductId)).thenAnswer(
          (_) async => ApiErrorResult(
            failure: Failure(errorMessage: 'Server error'),
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.getSpecificProduct(tProductId),
      expect: () => [
        const ProductDetailsState(isLoading: true),
        const ProductDetailsState(
          isLoading: false,
          isFailure: true,
          isSuccess: false,
          errorMessage: 'Server error',
        ),
      ],
    );
  });
}
