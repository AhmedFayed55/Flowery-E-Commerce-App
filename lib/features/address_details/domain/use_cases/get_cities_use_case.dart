import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/repositories/add_new_address_repo.dart';
import 'package:injectable/injectable.dart';

import '../entities/response/cities_response_entity.dart';

@injectable
class GetCitiesUseCase {
  final AddNewAddressRepo _repo;

  GetCitiesUseCase(this._repo);

  Future<ApiResult<CitiesResponseEntity>> invoke() async => _repo.getCities();
}
