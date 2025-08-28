import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/api_results.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/internet_connection.dart';
import '../../../../core/utils/app_constants.dart';
import '../../domain/entities/occasions_response_entity.dart';
import '../../domain/repositories/occasions_repo.dart';
import '../data_sources/occasions_ds.dart';
import '../models/occasions_response_dto.dart';

@Injectable(as: OccasionsRepository)
class OccasionsRepositoryImpl implements OccasionsRepository{
  final OccasionsDataSource _dataSource;
  final NetworkConnection _networkConnection;
  OccasionsRepositoryImpl(this._dataSource, this._networkConnection);

  @override
  Future<ApiResult<OccasionsResponseEntity>> getOccasions() async{

    if (!await _networkConnection.isConnected) {
      return ApiErrorResult(
        failure: Failure(errorMessage: AppConstants.noInternet),
      );
    }

    try{
      OccasionsResponseDto dto = await _dataSource.getOccasions();
      OccasionsResponseEntity entity = dto.toEntity();
      return ApiSuccessResult<OccasionsResponseEntity>(data: entity);
    } on DioException catch (e) {
      return ApiErrorResult<OccasionsResponseEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<OccasionsResponseEntity>(
        failure: Failure(errorMessage: e.toString()),
      );
    }

  }

}