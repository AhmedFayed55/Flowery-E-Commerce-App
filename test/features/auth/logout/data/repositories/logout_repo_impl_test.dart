import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/services/token_service.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/data/data_sources/logout_ds.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/data/models/logout_response_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/data/repositories/logout_repo_impl.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/entities/logout_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_repo_impl_test.mocks.dart';

@GenerateMocks([LogoutDataSource, TokenService])
void main() {
  final LogoutDataSource dataSource = MockLogoutDataSource();
  final MockTokenService tokenService = MockTokenService();
  final LogoutRepoImpl repoImpl = LogoutRepoImpl(dataSource, tokenService);
  final LogoutResponseDto expectedResponse = LogoutResponseDto(message: "Good");

  test('should return ApiSuccessResult when successfully', () async {
    when(dataSource.logout()).thenAnswer((_) async => expectedResponse);
    final result = await repoImpl.logout();

    verify(dataSource.logout()).called(1);

    expect(result, isA<ApiSuccessResult<LogoutResponseEntity>>());
    result as ApiSuccessResult<LogoutResponseEntity>;
    expect(result.data, isA<LogoutResponseEntity>());
  });

  test('should return ApiErrorResult when DioException is thrown', () async {
    final throwenException = DioException(
      requestOptions: RequestOptions(path: "/logout"),
      type: DioExceptionType.connectionTimeout,
    );

    when(dataSource.logout()).thenThrow(throwenException);

    final result = await repoImpl.logout();

    verify(dataSource.logout()).called(1);

    expect(result, isA<ApiErrorResult<LogoutResponseEntity>>());
    result as ApiErrorResult<LogoutResponseEntity>;
    expect(result.failure, isA<ServerFailure>());
  });

  test(
    'should return ApiErrorResult when unexpected error is thrown',
    () async {
      final throwenException = Exception("unexpected error");

      when(dataSource.logout()).thenThrow(throwenException);

      final result = await repoImpl.logout();

      verify(dataSource.logout()).called(1);

      expect(result, isA<ApiErrorResult<LogoutResponseEntity>>());
      result as ApiErrorResult<LogoutResponseEntity>;
      expect(result.failure, isA<Failure>());
      expect(result.failure.errorMessage, throwenException.toString());
    },
  );
}
