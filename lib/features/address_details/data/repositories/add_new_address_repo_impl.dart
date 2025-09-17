import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/data_sources/add_new_address_ds.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/request/add_new_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/addresses_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/area_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/cities_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/repositories/add_new_address_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../data_sources/local_ds/get_cities_and_areas_local_ds.dart';
import '../mapper/add_new_address_mapper.dart';

@Injectable(as: AddNewAddressRepo)
class AddNewAddressRepoImpl implements AddNewAddressRepo {
  final AddNewAddressDataSource _dataSource;
  final GetCitiesAndAreasLocalDataSource _localDataSource;

  AddNewAddressRepoImpl(this._dataSource, this._localDataSource);

  @override
  Future<ApiResult<AddressesResponseEntity>> addNewAddress(
    AddNewAddressRequestEntity requestEntity,
  ) async {
    try {
      final requestDto = toAddNewAddressRequestDto(requestEntity);
      final response = await _dataSource.addNewAddress(requestDto);

      return ApiSuccessResult(data: toAddressesResponseEntity(response));
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<ApiResult<AreaResponseEntity>> getAreas() async {
    try {
      final response = await _localDataSource.getAreas();
      return ApiSuccessResult(data: toAreaResponseEntity(response));
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<ApiResult<CitiesResponseEntity>> getCities() async {
    try {
      final response = await _localDataSource.getCities();
      return ApiSuccessResult(data: toCitiesResponseEntity(response));
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
