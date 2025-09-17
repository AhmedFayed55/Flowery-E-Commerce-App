import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/auth/change_password/data/data_sources/change_password_ds.dart';
import 'package:flowers_ecommerce_app/features/auth/change_password/data/models/request/change_password_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/change_password/data/models/response/change_password_response_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/change_password/data/repositories/change_password_repo_impl.dart';
import 'package:flowers_ecommerce_app/features/auth/change_password/domain/entities/change_password_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/change_password/domain/entities/change_password_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_repo_impl_test.mocks.dart';

@GenerateMocks([ChangePasswordDataSource])
void main() {
  final ChangePasswordDataSource dataSource = MockChangePasswordDataSource();
  final ChangePasswordRepoImpl repoImpl = ChangePasswordRepoImpl(dataSource);
  const ChangePasswordRequestDto requestDto = ChangePasswordRequestDto(
    password: "1",
    newPassword: "2",
  );
  const ChangePasswordRequestEntity requestEntity = ChangePasswordRequestEntity(
    password: "1",
    newPassword: "2",
  );
  const ChangePasswordResponseDto expectedResponse = ChangePasswordResponseDto(
    message: "Good",
    token: "jhbkjas",
  );

  test('should return ApiSuccessResult when successfully', () async {
    when(
      dataSource.changePassword(requestDto),
    ).thenAnswer((_) async => expectedResponse);

    final result = await repoImpl.changePassword(requestEntity);

    verify(dataSource.changePassword(requestDto)).called(1);

    expect(result, isA<ApiSuccessResult<ChangePasswordResponseEntity>>());
    result as ApiSuccessResult<ChangePasswordResponseEntity>;
    expect(result.data, isA<ChangePasswordResponseEntity>());
  });

  test('should return ApiErrorResult when DioException is thrown', () async {
    final throwenException = DioException(
      requestOptions: RequestOptions(path: "/occasions"),
      type: DioExceptionType.connectionTimeout,
    );

    when(dataSource.changePassword(requestDto)).thenThrow(throwenException);

    final result = await repoImpl.changePassword(requestEntity);

    verify(dataSource.changePassword(requestDto)).called(1);

    expect(result, isA<ApiErrorResult<ChangePasswordResponseEntity>>());
    result as ApiErrorResult<ChangePasswordResponseEntity>;
    expect(result.failure, isA<ServerFailure>());
  });

  test(
    'should return ApiErrorResult when unexpected error is thrown',
    () async {
      final throwenException = Exception("unexpected error");

      when(dataSource.changePassword(requestDto)).thenThrow(throwenException);

      final result = await repoImpl.changePassword(requestEntity);

      verify(dataSource.changePassword(requestDto)).called(1);

      expect(result, isA<ApiErrorResult<ChangePasswordResponseEntity>>());
      result as ApiErrorResult<ChangePasswordResponseEntity>;
      expect(result.failure, isA<Failure>());
      expect(result.failure.errorMessage, throwenException.toString());
    },
  );
}
