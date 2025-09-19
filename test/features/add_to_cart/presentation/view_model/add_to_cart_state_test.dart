import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_respone.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/domin/usecase/add_to_cart_usecase.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/presentation/view_model/add_to_cart_cubit.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/presentation/view_model/add_to_cart_event.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/presentation/view_model/add_to_cart_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_to_cart_state_test.mocks.dart';

@GenerateMocks([AddToCartUsecase])
void main() {
  late AddToCartCubit cubit;
  late MockAddToCartUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockAddToCartUsecase();
    cubit = AddToCartCubit(mockUsecase);
    provideDummy<ApiResult<AddProductRespone>>(
      ApiSuccessResult(data: AddProductRespone(message: '', numOfCartItems: 0)),
    );
  });

  group('AddToCartCubit', () {
    const productId = '1';

    blocTest<AddToCartCubit, AddToCartState>(
      'emits [isSucsses true] when AddProductToCart succeeds',
      build: () {
        when(mockUsecase.invoke(any)).thenAnswer(
          (_) async => ApiSuccessResult<AddProductRespone>(
            data: AddProductRespone(message: '', numOfCartItems: 0),
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.doIntent(AddProductToCart(productId)),
      expect: () => [
        isA<AddToCartState>()
            .having((s) => s.isSucsses, 'isSucsses', true)
            .having((s) => s.errorMsg, 'errorMsg', ''),
      ],
      verify: (_) {
        verify(mockUsecase.invoke(any)).called(1);
      },
    );

    blocTest<AddToCartCubit, AddToCartState>(
      'emits [isSucsses false with errorMsg] when AddProductToCart fails',
      build: () {
        when(mockUsecase.invoke(any)).thenAnswer(
          (_) async => ApiErrorResult<AddProductRespone>(
            failure: ServerFailure(errorMessage: 'error occurred'),
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.doIntent(AddProductToCart(productId)),
      expect: () => [
        const AddToCartState(isSucsses: false, errorMsg: 'error occurred'),
      ],
    );
  });
}
