import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/data_sources/saved_address_ds.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/maper/maper.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/entities/remove_address_data_entity.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/repositories/saved_address_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';

@Injectable(as: SavedAddressRepo)
class SavedAddressRepoImpl implements SavedAddressRepo {
  final SavedAddressDataSource _dataSource;

  SavedAddressRepoImpl(this._dataSource);

  @override
  Future<ApiResult<List<RemoveAddressDataEntity>>> removeAddress(
    String id,
  ) async {
    try {
      final response = await _dataSource.removeAddress(id);

      return ApiSuccessResult(
        data: response.address!
            .map((e) => toRemoveAddressDataEntity(e))
            .toList(),
      );
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<ApiResult<List<RemoveAddressDataEntity>>> getAllAddresses() async {
    try {
      final response = await _dataSource.getAllAddresses();

      return ApiSuccessResult(
        data: response.address!
            .map((e) => toRemoveAddressDataEntity(e))
            .toList(),
      );
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
