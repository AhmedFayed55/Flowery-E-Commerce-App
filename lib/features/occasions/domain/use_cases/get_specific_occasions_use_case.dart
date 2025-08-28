import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/occasions_response_entity.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/repositories/occasions_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSpecificOccasionsUseCase{
  final OccasionsRepository _repository;
  GetSpecificOccasionsUseCase(this._repository);

  Future<ApiResult<OccasionsResponseEntity>> invoke() => _repository.getOccasions();
}