import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/search_response_entity.dart';
import 'package:flowers_ecommerce_app/features/search/domain/repository/search_repo.dart';
import 'package:flowers_ecommerce_app/features/search/domain/usecases/search_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'search_usecase_test.mocks.dart';

@GenerateMocks([SearchRepo])
void main() {
  late String keyword;
  late String errorMessage;
  late String entityMessage;
  late MockSearchRepo mockSearchRepo;
  late SearchUseCase searchUseCase;
  late SearchResponseEntity searchResponseEntity;

  setUpAll(() {
    keyword = "keyword";
    errorMessage = "Error";
    entityMessage = "Success";
    mockSearchRepo = MockSearchRepo();
    searchResponseEntity = SearchResponseEntity(message: entityMessage);
    searchUseCase = SearchUseCase(searchRepo: mockSearchRepo);
  });

  group("Test search in Domain Layer", () {
    /// Success
    test("Success Case for SearchUseCase with ApiSuccessResult", () async {
      var mockSuccessResult = ApiSuccessResult<SearchResponseEntity>(
        data: searchResponseEntity,
      );
      provideDummy<ApiResult<SearchResponseEntity>>(mockSuccessResult);

      /// Arrange
      when(
        mockSearchRepo.search(keyword),
      ).thenAnswer((_) async => mockSuccessResult);

      /// Act
      var result = await searchUseCase.call(keyword);

      /// Assert
      expect(result, isA<ApiSuccessResult<SearchResponseEntity>>());
      ApiSuccessResult<SearchResponseEntity> successResult =
          result as ApiSuccessResult<SearchResponseEntity>;
      expect(successResult.data, equals(mockSuccessResult.data));

      verify(mockSearchRepo.search(keyword)).called(1);
    });

    /// Error
    test("Error Case for SearchUseCase with ApiErrorResult", () async {
      var mockFailure = Failure(errorMessage: errorMessage);
      var mockErrorResult = ApiErrorResult<SearchResponseEntity>(
        failure: mockFailure,
      );
      provideDummy<ApiResult<SearchResponseEntity>>(mockErrorResult);

      /// Arrange
      when(mockSearchRepo.search(keyword)).thenAnswer(
        (_) async => ApiErrorResult<SearchResponseEntity>(failure: mockFailure),
      );

      /// Act
      var result = await searchUseCase.call(keyword);

      /// Assert
      expect(result, isA<ApiErrorResult<SearchResponseEntity>>());
      ApiErrorResult<SearchResponseEntity> errorResult =
          result as ApiErrorResult<SearchResponseEntity>;
      expect(
        errorResult.failure.errorMessage,
        equals(mockErrorResult.failure.errorMessage),
      );

      verify(mockSearchRepo.search(keyword)).called(1);
    });
  });
}
