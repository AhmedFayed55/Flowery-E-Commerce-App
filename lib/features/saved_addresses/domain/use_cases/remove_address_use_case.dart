import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:injectable/injectable.dart';

import '../entities/user_address_data_entity.dart';
import '../repositories/saved_address_repo.dart';

@injectable
class RemoveAddressUseCase {
  final SavedAddressRepo _repo;

  RemoveAddressUseCase(this._repo);

  Future<ApiResult<List<UserAddressDataEntity>>> invoke(String id) =>
      _repo.removeAddress(id);
}
