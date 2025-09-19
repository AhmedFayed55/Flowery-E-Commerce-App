import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/data_sources/saved_address_ds.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/get_user_address_dto.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/user_address_data_dto.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/user_address_dto.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/repositories/saved_address_repo_impl.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/entities/user_address_data_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'saved_address_repo_impl_test.mocks.dart';

@GenerateMocks([SavedAddressDataSource])
void main() {
  late MockSavedAddressDataSource mockDataSource;
  late SavedAddressRepoImpl repository;

  setUp(() {
    mockDataSource = MockSavedAddressDataSource();
    repository = SavedAddressRepoImpl(mockDataSource);
  });

  group("getAllAddresses", () {
    test("should return ApiSuccessResult when call succeeds", () async {
      final expectedResponse = GetUserAddressDto(
        address: [
          UserAddressDataDto(),
          UserAddressDataDto(),
          UserAddressDataDto(),
        ],
      );

      when(
        mockDataSource.getAllAddresses(),
      ).thenAnswer((_) async => expectedResponse);

      final result = await repository.getAllAddresses();

      verify(mockDataSource.getAllAddresses()).called(1);
      expect(result, isA<ApiSuccessResult<List<UserAddressDataEntity>>>());
      result as ApiSuccessResult<List<UserAddressDataEntity>>;
      expect(result.data.length, expectedResponse.address!.length);
    });

    test("should return ApiErrorResult when DioException is thrown", () async {
      final dioError = DioException(
        requestOptions: RequestOptions(path: "/addresses"),
        type: DioExceptionType.connectionTimeout,
      );

      when(mockDataSource.getAllAddresses()).thenThrow(dioError);

      final result = await repository.getAllAddresses();

      verify(mockDataSource.getAllAddresses()).called(1);
      expect(result, isA<ApiErrorResult<List<UserAddressDataEntity>>>());
      result as ApiErrorResult<List<UserAddressDataEntity>>;
      expect(result.failure, isA<ServerFailure>());
    });

    test(
      "should return ApiErrorResult when unexpected error is thrown",
      () async {
        final exception = Exception("unexpected error");

        when(mockDataSource.getAllAddresses()).thenThrow(exception);

        final result = await repository.getAllAddresses();

        verify(mockDataSource.getAllAddresses()).called(1);
        expect(result, isA<ApiErrorResult<List<UserAddressDataEntity>>>());
        result as ApiErrorResult<List<UserAddressDataEntity>>;
        expect(result.failure, isA<Failure>());
        expect(result.failure.errorMessage, exception.toString());
      },
    );
  });

  group("removeAddress", () {
    test("should return ApiSuccessResult when call succeeds", () async {
      final expectedResponse = UserAddressDto(
        message: "removed successfully",
        address: [UserAddressDataDto(id: "1", street: "Street 1")],
      );

      when(
        mockDataSource.removeAddress("1"),
      ).thenAnswer((_) async => expectedResponse);

      final result = await repository.removeAddress("1");

      verify(mockDataSource.removeAddress("1")).called(1);
      expect(result, isA<ApiSuccessResult<List<UserAddressDataEntity>>>());
      result as ApiSuccessResult<List<UserAddressDataEntity>>;
      expect(result.data.length, expectedResponse.address!.length);
    });

    test("should return ApiErrorResult when DioException is thrown", () async {
      final dioError = DioException(
        requestOptions: RequestOptions(path: "/addresses/1"),
        type: DioExceptionType.connectionTimeout,
      );

      when(mockDataSource.removeAddress("1")).thenThrow(dioError);

      final result = await repository.removeAddress("1");

      verify(mockDataSource.removeAddress("1")).called(1);
      expect(result, isA<ApiErrorResult<List<UserAddressDataEntity>>>());
      result as ApiErrorResult<List<UserAddressDataEntity>>;
      expect(result.failure, isA<ServerFailure>());
    });

    test(
      "should return ApiErrorResult when unexpected error is thrown",
      () async {
        final exception = Exception("unexpected error");

        when(mockDataSource.removeAddress("1")).thenThrow(exception);

        final result = await repository.removeAddress("1");

        verify(mockDataSource.removeAddress("1")).called(1);
        expect(result, isA<ApiErrorResult<List<UserAddressDataEntity>>>());
        result as ApiErrorResult<List<UserAddressDataEntity>>;
        expect(result.failure, isA<Failure>());
        expect(result.failure.errorMessage, exception.toString());
      },
    );
  });
}
