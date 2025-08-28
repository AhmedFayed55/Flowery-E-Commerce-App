import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/repository/get_all_category.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/usecases/get_all_category_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_category_usecase_test.mocks.dart';

@GenerateMocks([GetAllCategoryRepositoryContract])
void main() {
  late MockGetAllCategoryRepositoryContract
  mockGetAllCategoryRepositoryContract;
  late String errorMessage;
  late GetAllCategoryUseCase getAllCategoryUseCase;
  setUp(() {
    errorMessage = "Error";
    mockGetAllCategoryRepositoryContract =
        MockGetAllCategoryRepositoryContract();
    getAllCategoryUseCase = GetAllCategoryUseCase(
      getAllCategoryRepositoryContract: mockGetAllCategoryRepositoryContract,
    );
  });

  group("Test getAllCategoryUseCase in Domain Layer", () {

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
        mockGetAllCategoryRepositoryContract.getAllCategory(),
      ).thenAnswer((_) async => mockSuccessResult);

      ///Act
      var result = await getAllCategoryUseCase.call();

      ///Assert
      expect(result, isA<ApiSuccessResult<List<CategoryModel>>>());
      ApiSuccessResult<List<CategoryModel>> successResult =
          result as ApiSuccessResult<List<CategoryModel>>;
      expect(successResult.data[0].id, equals(mockSuccessResult.data[0].id));

      verify(mockGetAllCategoryRepositoryContract.getAllCategory()).called(1);
    });

    /// ErrorException
    test(
      "ErrorException case for getAllCategory with ApiErrorResult",
      () async {
        Failure mockFailure = Failure(errorMessage: errorMessage);

        var mockErrorResult = ApiErrorResult<List<CategoryModel>>(
          failure: mockFailure,
        );

        /// Arrange
        when(
          mockGetAllCategoryRepositoryContract.getAllCategory(),
        ).thenAnswer((_) async => mockErrorResult);

        /// Act
        var result = await getAllCategoryUseCase.call();

        /// Assert
        expect(result, isA<ApiErrorResult<List<CategoryModel>>>());
        ApiErrorResult<List<CategoryModel>> errorResult =
            result as ApiErrorResult<List<CategoryModel>>;
        expect(
          errorResult.failure.errorMessage,
          equals(mockFailure.errorMessage),
        );

        verify(mockGetAllCategoryRepositoryContract.getAllCategory()).called(1);
      },
    );
  });
}
