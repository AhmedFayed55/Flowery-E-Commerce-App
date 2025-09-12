import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/request/add_new_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/addresses_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/repositories/add_new_address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddNewAddressUseCase {
  final AddNewAddressRepo _repo;

  AddNewAddressUseCase(this._repo);

  Future<ApiResult<AddressesResponseEntity>> invoke(
    AddNewAddressRequestEntity request,
  ) => _repo.addNewAddress(request);
}
