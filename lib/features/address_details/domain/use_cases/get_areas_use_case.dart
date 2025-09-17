import 'package:flowers_ecommerce_app/features/address_details/domain/repositories/add_new_address_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/api_results.dart';
import '../entities/response/area_response_entity.dart';

@injectable
class GetAreasUseCase {
  final AddNewAddressRepo _repo;

  GetAreasUseCase(this._repo);

  Future<ApiResult<AreaResponseEntity>> invoke() async => _repo.getAreas();
}
