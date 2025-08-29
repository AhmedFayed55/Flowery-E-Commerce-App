import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/categories/data/datasources/remote/category_remote_datasource_impl.dart';
import 'package:flowers_ecommerce_app/features/categories/data/datasources/remote/product_remote_datasource_impl.dart';
import 'package:flowers_ecommerce_app/features/categories/data/models/category_dto.dart';
import 'package:flowers_ecommerce_app/features/categories/data/models/products_dto.dart';
import 'package:flowers_ecommerce_app/features/categories/data/models/response/category_response.dart';
import 'package:flowers_ecommerce_app/features/categories/data/models/response/product_response.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_category_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  late MockApiServices mockApiServices;
  late String errorMessage;
  late GetAllCategoryRemoteDatasourceImpl getAllCategoryRemoteDatasourceImpl;
  setUp(() {
    errorMessage = "Error";
    mockApiServices = MockApiServices();
    getAllCategoryRemoteDatasourceImpl = GetAllCategoryRemoteDatasourceImpl(
      apiServices: mockApiServices,
    );
  });

  group("Test GetAllCategoryRemoteDatasourceImpl in Data Layer", () {
    /// Success
    test("Success Case for getAllCategories with ApiSuccessResult", () async {
      ///Arrange
      final categoriesDTO = [
        CategoriesDTO(
          Id: "1",
          name: "category-1",
          image: 'image-1',
          slug: 'slug-1',
        ),
        CategoriesDTO(
          Id: "2",
          name: "category-2",
          image: 'image-2',
          slug: 'slug-2',
        ),
      ];

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
      when(
        mockApiServices.getAllCategory(),
      ).thenAnswer((_) async => CategoryResponse(categories: categoriesDTO));

      ///Act
      var result = await getAllCategoryRemoteDatasourceImpl.getAllCategory();

      ///Assert
      expect(result, isA<ApiSuccessResult<List<CategoryModel>>>());
      ApiSuccessResult<List<CategoryModel>> successResult =
          result as ApiSuccessResult<List<CategoryModel>>;
      expect(successResult.data[0].name, equals(categoryModelList[0].name));

      verify(mockApiServices.getAllCategory()).called(1);
    });

    /// ErrorException
    test(
      "ErrorException case for getAllCategory with ApiErrorResult",
      () async {
        Failure mockFailure = Failure(
          errorMessage: Exception(errorMessage).toString(),
        );

        /// Arrange
        when(
          mockApiServices.getAllCategory(),
        ).thenThrow(Exception(errorMessage));

        /// Act
        var result = await getAllCategoryRemoteDatasourceImpl.getAllCategory();

        /// Assert
        expect(result, isA<ApiErrorResult<List<CategoryModel>>>());
        ApiErrorResult<List<CategoryModel>> errorResult =
            result as ApiErrorResult<List<CategoryModel>>;
        expect(
          errorResult.failure.errorMessage,
          equals(mockFailure.errorMessage),
        );

        verify(mockApiServices.getAllCategory()).called(1);
      },
    );
  });
}
