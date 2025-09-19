import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/usecases/category_usecase.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/usecases/product_usecase.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_cubit_test.mocks.dart';

@GenerateMocks([GetAllCategoryUseCase, GetAllProductsUseCase])
void main() {
  late MockGetAllCategoryUseCase mockGetAllCategoryUseCase;
  late MockGetAllProductsUseCase mockGetAllProductsUseCase;
  late String errorMessage;
  late CategoryCubit categoryCubit;
  setUp(() {
    errorMessage = "Error";
    mockGetAllCategoryUseCase = MockGetAllCategoryUseCase();
    mockGetAllProductsUseCase = MockGetAllProductsUseCase();
    categoryCubit = CategoryCubit(
      getAllCategoryUseCase: mockGetAllCategoryUseCase,
      getAllProductsUseCase: mockGetAllProductsUseCase,
    );
  });

  group("Test getAllCategoryUseCase in Presentation Layer", () {
    /// Success
    test("Success Case for getAllCategories with ApiSuccessResult", () async {
      ///Arrange
      final categoryModelList = [
        CategoryModel(
          id: "1",
          name: "category-1",
          image: 'image-1',
          slug: 'slug-1',
        ),
        CategoryModel(
          id: "2",
          name: "category-2",
          image: 'image-2',
          slug: 'slug-2',
        ),
      ];
      var mockSuccessResult = ApiSuccessResult<List<CategoryModel>>(
        data: categoryModelList,
      );
      provideDummy<ApiResult<List<CategoryModel>>>(mockSuccessResult);

      when(
        mockGetAllCategoryUseCase.call(),
      ).thenAnswer((_) async => mockSuccessResult);

      ///Act
      await categoryCubit.doIntent(GetAllCategoryEvent());

      ///Assert
      expect(categoryCubit.state.isLoading, false);
      expect(categoryCubit.state.isSuccess, true);

      verify(mockGetAllCategoryUseCase.call()).called(1);
    });

    /// ErrorException
    test(
      "ErrorException case for getAllCategory with ApiErrorResult",
      () async {
        Failure mockFailure = Failure(errorMessage: errorMessage);

        var mockErrorResult = ApiErrorResult<List<CategoryModel>>(
          failure: mockFailure,
        );
        provideDummy<ApiResult<List<CategoryModel>>>(mockErrorResult);

        /// Arrange
        when(
          mockGetAllCategoryUseCase.call(),
        ).thenAnswer((_) async => mockErrorResult);

        /// Act
        await categoryCubit.doIntent(GetAllCategoryEvent());

        /// Assert
        expect(categoryCubit.state.isLoading, false);
        expect(categoryCubit.state.isError, true);

        verify(mockGetAllCategoryUseCase.call()).called(1);
      },
    );
  });
}
