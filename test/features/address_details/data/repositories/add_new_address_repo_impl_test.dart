import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/data_sources/add_new_address_ds.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/data_sources/local_ds/get_cities_and_areas_local_ds.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/address_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/addresses_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/area_data_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/area_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/cities_data_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/cities_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/repositories/add_new_address_repo_impl.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/request/add_new_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/addresses_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/area_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/cities_data_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/cities_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_new_address_repo_impl_test.mocks.dart';

@GenerateMocks([AddNewAddressDataSource, GetCitiesAndAreasLocalDataSource])
void main() {
  late MockAddNewAddressDataSource mockRemoteDS;
  late MockGetCitiesAndAreasLocalDataSource mockLocalDS;
  late AddNewAddressRepoImpl repo;

  setUp(() {
    mockRemoteDS = MockAddNewAddressDataSource();
    mockLocalDS = MockGetCitiesAndAreasLocalDataSource();
    repo = AddNewAddressRepoImpl(mockRemoteDS, mockLocalDS);
  });

  group('addNewAddress', () {
    const requestEntity = AddNewAddressRequestEntity(
      street: 'Street 1',
      city: 'Cairo',
      phone: '01012345678',
      lat: '5451.5',
      long: '451.2',
      username: 'ahmedfayed',
    );

    test('should return ApiSuccessResult when successful', () async {
      final responseDto = AddressesResponseDto(
        address: [AddressDto(), AddressDto(), AddressDto()],
        message: 'OK',
      );

      when(
        mockRemoteDS.addNewAddress(any),
      ).thenAnswer((_) async => responseDto);

      final result = await repo.addNewAddress(requestEntity);

      verify(mockRemoteDS.addNewAddress(any)).called(1);

      expect(result, isA<ApiSuccessResult<AddressesResponseEntity>>());
      result as ApiSuccessResult<AddressesResponseEntity>;
      expect(result.data.address!.length, responseDto.address!.length);
    });

    test('should return ApiErrorResult when DioException is thrown', () async {
      final exception = DioException(
        requestOptions: RequestOptions(path: '/add'),
        type: DioExceptionType.connectionTimeout,
      );

      when(mockRemoteDS.addNewAddress(any)).thenThrow(exception);

      final result = await repo.addNewAddress(requestEntity);

      expect(result, isA<ApiErrorResult<AddressesResponseEntity>>());
      result as ApiErrorResult<AddressesResponseEntity>;
      expect(result.failure, isA<ServerFailure>());
    });

    test(
      'should return ApiErrorResult when unexpected error is thrown',
      () async {
        final exception = Exception('unexpected');

        when(mockRemoteDS.addNewAddress(any)).thenThrow(exception);

        final result = await repo.addNewAddress(requestEntity);

        expect(result, isA<ApiErrorResult<AddressesResponseEntity>>());
        result as ApiErrorResult<AddressesResponseEntity>;
        expect(result.failure, isA<Failure>());
        expect(result.failure.errorMessage, exception.toString());
      },
    );
  });

  group('getAreas', () {
    test('should return ApiSuccessResult when successful', () async {
      final responseDto = AreaResponseDto(
        data: [
          AreaDataResponseDto(),
          AreaDataResponseDto(),
          AreaDataResponseDto(),
        ],
      );

      when(mockLocalDS.getAreas()).thenAnswer((_) async => responseDto);

      final result = await repo.getAreas();

      verify(mockLocalDS.getAreas()).called(1);
      expect(result, isA<ApiSuccessResult<AreaResponseEntity>>());
      result as ApiSuccessResult<AreaResponseEntity>;
      expect(result.data.data!.length, equals(responseDto.data!.length));
      expect(result.data.data!.first, isA<AreaDataResponseEntity>());
    });

    test('should return ApiErrorResult when DioException is thrown', () async {
      final exception = DioException(
        requestOptions: RequestOptions(path: '/areas'),
        type: DioExceptionType.receiveTimeout,
      );

      when(mockLocalDS.getAreas()).thenThrow(exception);

      final result = await repo.getAreas();

      expect(result, isA<ApiErrorResult<AreaResponseEntity>>());
      result as ApiErrorResult<AreaResponseEntity>;
      expect(result.failure, isA<ServerFailure>());
    });

    test(
      'should return ApiErrorResult when unexpected error is thrown',
      () async {
        final exception = Exception('unexpected areas');

        when(mockLocalDS.getAreas()).thenThrow(exception);

        final result = await repo.getAreas();

        expect(result, isA<ApiErrorResult<AreaResponseEntity>>());
        result as ApiErrorResult<AreaResponseEntity>;
        expect(result.failure, isA<Failure>());
        expect(result.failure.errorMessage, exception.toString());
      },
    );
  });

  group('getCities', () {
    test('should return ApiSuccessResult when successful', () async {
      final responseDto = CitiesResponseDto(
        data: [
          CitiesDataResponseDto(),
          CitiesDataResponseDto(),
          CitiesDataResponseDto(),
        ],
      );

      when(mockLocalDS.getCities()).thenAnswer((_) async => responseDto);

      final result = await repo.getCities();

      verify(mockLocalDS.getCities()).called(1);
      expect(result, isA<ApiSuccessResult<CitiesResponseEntity>>());
      result as ApiSuccessResult<CitiesResponseEntity>;
      expect(result.data.data!.length, equals(responseDto.data!.length));
      expect(result.data.data!.first, isA<CitiesDataResponseEntity>());
    });

    test('should return ApiErrorResult when DioException is thrown', () async {
      final exception = DioException(
        requestOptions: RequestOptions(path: '/cities'),
        type: DioExceptionType.connectionError,
      );

      when(mockLocalDS.getCities()).thenThrow(exception);

      final result = await repo.getCities();

      expect(result, isA<ApiErrorResult<CitiesResponseEntity>>());
      result as ApiErrorResult<CitiesResponseEntity>;
      expect(result.failure, isA<ServerFailure>());
    });

    test(
      'should return ApiErrorResult when unexpected error is thrown',
      () async {
        final exception = Exception('unexpected cities');

        when(mockLocalDS.getCities()).thenThrow(exception);

        final result = await repo.getCities();

        expect(result, isA<ApiErrorResult<CitiesResponseEntity>>());
        result as ApiErrorResult<CitiesResponseEntity>;
        expect(result.failure, isA<Failure>());
        expect(result.failure.errorMessage, exception.toString());
      },
    );
  });
}
