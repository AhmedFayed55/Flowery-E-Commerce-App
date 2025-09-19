import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/errors/internet_connection.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/data_sources/occasions_ds.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/models/occasions_response_dto.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/models/products_dto.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/repositories/occasions_repo_impl.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/occasions_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasions_repo_impl_test.mocks.dart';

@GenerateMocks([OccasionsDataSource, NetworkConnection])
void main() {
  NetworkConnection networkConnection = MockNetworkConnection();
  OccasionsDataSource dataSource = MockOccasionsDataSource();
  OccasionsRepositoryImpl repositoryImpl = OccasionsRepositoryImpl(
    dataSource,
    networkConnection,
  );

  test(
    'when call getAllOccasions with no internet should return ApiErrorResult',
    () async {
      when(networkConnection.isConnected).thenAnswer((_) async => false);

      final result = await repositoryImpl.getOccasions();

      expect(result, isA<ApiErrorResult<OccasionsResponseEntity>>());
      result as ApiErrorResult<OccasionsResponseEntity>;
      expect(result.failure.errorMessage, AppConstants.noInternet);
    },
  );

  test(
    'when call getAllOccasions should return ApiSuccessResult when successfully',
    () async {
      when(networkConnection.isConnected).thenAnswer((_) async => true);

      final expectedResponse = OccasionsResponseDto(
        products: [
          ProductsDto(id: "1"),
          ProductsDto(id: "2"),
        ],
      );
      when(dataSource.getOccasions()).thenAnswer((_) async => expectedResponse);

      final result = await repositoryImpl.getOccasions();

      verify(dataSource.getOccasions()).called(1);
      expect(result, isA<ApiSuccessResult<OccasionsResponseEntity>>());
      result as ApiSuccessResult<OccasionsResponseEntity>;
      expect(result.data, isA<OccasionsResponseEntity>());
      expect(
        result.data.products?.length,
        equals(expectedResponse.products?.length),
      );
    },
  );

  test("should return ApiErrorResult when DioException is thrown", () async {
    when(networkConnection.isConnected).thenAnswer((_) async => true);

    final throwenException = DioException(
      requestOptions: RequestOptions(path: "/occasions"),
      type: DioExceptionType.connectionTimeout,
    );

    when(dataSource.getOccasions()).thenThrow(throwenException);
    final result = await repositoryImpl.getOccasions();

    verify(dataSource.getOccasions()).called(1);
    expect(result, isA<ApiErrorResult<OccasionsResponseEntity>>());
    result as ApiErrorResult<OccasionsResponseEntity>;
    expect(result.failure, isA<ServerFailure>());
  });

  test(
    "should return ApiErrorResult when unexpected error is thrown",
    () async {
      when(networkConnection.isConnected).thenAnswer((_) async => true);

      final throwenException = Exception("unexpected error");

      when(dataSource.getOccasions()).thenThrow(throwenException);
      final result = await repositoryImpl.getOccasions();

      verify(dataSource.getOccasions()).called(1);
      expect(result, isA<ApiErrorResult<OccasionsResponseEntity>>());
      result as ApiErrorResult<OccasionsResponseEntity>;
      expect(result.failure, isA<Failure>());
      expect(result.failure.errorMessage, throwenException.toString());
    },
  );
}
