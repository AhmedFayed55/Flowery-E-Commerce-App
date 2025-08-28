import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/occasions_response_entity.dart';

abstract interface class OccasionsRepository{
  Future<ApiResult<OccasionsResponseEntity>> getOccasions();
}