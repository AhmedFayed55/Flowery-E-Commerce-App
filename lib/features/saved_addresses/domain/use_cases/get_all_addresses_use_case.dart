import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/entities/remove_address_data_entity.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/repositories/saved_address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllAddressesUseCase {
  final SavedAddressRepo _repo;

  GetAllAddressesUseCase(this._repo);

  Future<ApiResult<List<RemoveAddressDataEntity>>> invoke() =>
      _repo.getAllAddresses();
}
