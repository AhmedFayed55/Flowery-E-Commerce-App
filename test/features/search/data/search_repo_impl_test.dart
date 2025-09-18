import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/search/data/datasources/remote/search_remote_ds.dart';
import 'package:flowers_ecommerce_app/features/search/data/repository_impl/search_repo_impl.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/search_response_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'search_repo_impl_test.mocks.dart';

@GenerateMocks([SearchRemoteDataSource])
void main() {
  late String errorMessage;
  late String entityMessage;
  late String keyword;
  late MockSearchRemoteDataSource mockSearchRemoteDataSource;
  late SearchRepoImpl searchRepoImpl;
  late SearchResponseEntity searchResponseEntity;

  setUp(() {
    keyword = "keyword";
    errorMessage = "Error";
    entityMessage = "entityMessage";
    mockSearchRemoteDataSource = MockSearchRemoteDataSource();
    searchResponseEntity = SearchResponseEntity(message: entityMessage);
    searchRepoImpl = SearchRepoImpl(
      searchRemoteDataSource: mockSearchRemoteDataSource,
    );
  });

  group("Test search in Data Layer", () {
    /// Success
    test("Success Case for SearchRepoImpl with ApiSuccessResult", () async {
      var mockSuccessResult = ApiSuccessResult<SearchResponseEntity>(
        data: searchResponseEntity,
      );
      provideDummy<ApiResult<SearchResponseEntity>>(mockSuccessResult);

      /// Arrange
      when(
        mockSearchRemoteDataSource.search(keyword),
      ).thenAnswer((_) async => mockSuccessResult);

      /// Act
      var result = await searchRepoImpl.search(keyword);

      /// Assert
      expect(result, isA<ApiSuccessResult<SearchResponseEntity>>());
      ApiSuccessResult<SearchResponseEntity> successResult =
          result as ApiSuccessResult<SearchResponseEntity>;
      expect(
        successResult.data.message,
        equals(mockSuccessResult.data.message),
      );

      verify(mockSearchRemoteDataSource.search(keyword)).called(1);
    });

    /// Error
    test("Error Case for SearchRepoImpl with ApiErrorResult", () async {
      var mockFailure = Failure(errorMessage: errorMessage);
      var mockErrorResult = ApiErrorResult<SearchResponseEntity>(
        failure: mockFailure,
      );
      provideDummy<ApiResult<SearchResponseEntity>>(mockErrorResult);

      /// Arrange
      when(mockSearchRemoteDataSource.search(keyword)).thenAnswer(
        (_) async => ApiErrorResult<SearchResponseEntity>(failure: mockFailure),
      );

      /// Act
      var result = await searchRepoImpl.search(keyword);

      /// Assert
      expect(result, isA<ApiErrorResult<SearchResponseEntity>>());
      ApiErrorResult<SearchResponseEntity> errorResult =
          result as ApiErrorResult<SearchResponseEntity>;
      expect(
        errorResult.failure.errorMessage,
        equals(mockErrorResult.failure.errorMessage),
      );

      verify(mockSearchRemoteDataSource.search(keyword)).called(1);
    });
  });
}
