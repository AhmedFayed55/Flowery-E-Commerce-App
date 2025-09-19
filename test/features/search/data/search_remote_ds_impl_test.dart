import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/search/data/datasources/remote/search_remote_ds_impl.dart';
import 'package:flowers_ecommerce_app/features/search/data/models/reponse/search_response.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/search_response_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../../features/search/data/search_remote_ds_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  late MockApiServices mockApiServices;
  late String keyword;
  late String errorMessage;
  late String successMessage;
  late SearchResponse searchResponse;
  late SearchRemoteDataSourceImpl searchRemoteDataSourceImpl;

  setUp(() {
    successMessage = "Success";
    errorMessage = "Error message";
    keyword = "keyword";
    mockApiServices = MockApiServices();
    searchResponse = SearchResponse(message: successMessage);
    searchRemoteDataSourceImpl = SearchRemoteDataSourceImpl(
      apiServices: mockApiServices,
    );
  });

  group("Test search in Data Layer", () {
    /// Success
    test(
      "success case for SearchRemoteDataSourceImpl with ApiSuccessResult",
      () async {
        /// Arrange
        when(
          mockApiServices.search(keyword),
        ).thenAnswer((_) async => searchResponse);

        /// Act
        var result = await searchRemoteDataSourceImpl.search(keyword);

        /// Assert
        expect(result, isA<ApiSuccessResult<SearchResponseEntity>>());
        ApiSuccessResult<SearchResponseEntity> successResult =
            result as ApiSuccessResult<SearchResponseEntity>;
        expect(successResult.data.message, equals(searchResponse.message));

        verify(mockApiServices.search(keyword)).called(1);
      },
    );

    /// ErrorDioException
    test(
      "ErrorDioException case for SearchRemoteDataSourceImpl with ApiErrorResult",
      () async {
        final dioException = DioException(
          requestOptions: RequestOptions(),
          message: errorMessage,
        );
        final ServerFailure mockServerFailureFromDioError =
            ServerFailure.fromDioError(dioException: dioException);

        /// Arrange
        when(mockApiServices.search(keyword)).thenThrow(dioException);

        /// Act
        var result = await searchRemoteDataSourceImpl.search(keyword);

        /// Assert
        expect(result, isA<ApiErrorResult<SearchResponseEntity>>());
        ApiErrorResult<SearchResponseEntity> errorResult =
            result as ApiErrorResult<SearchResponseEntity>;
        expect(
          errorResult.failure.errorMessage,
          equals(mockServerFailureFromDioError.errorMessage),
        );

        verify(mockApiServices.search(keyword)).called(1);
      },
    );

    /// ErrorException
    test(
      "ErrorException case for SearchRemoteDataSourceImpl with ApiErrorResult",
      () async {
        Failure mockFailure = Failure(
          errorMessage: "Error ==> ${Exception(errorMessage).toString()}",
        );

        /// Arrange
        when(
          mockApiServices.search(keyword),
        ).thenThrow(Exception(errorMessage));

        /// Act
        var result = await searchRemoteDataSourceImpl.search(keyword);

        /// Assert
        expect(result, isA<ApiErrorResult<SearchResponseEntity>>());
        ApiErrorResult<SearchResponseEntity> errorResult =
            result as ApiErrorResult<SearchResponseEntity>;
        expect(
          errorResult.failure.errorMessage,
          equals(mockFailure.errorMessage),
        );

        verify(mockApiServices.search(keyword)).called(1);
      },
    );
  });
}
