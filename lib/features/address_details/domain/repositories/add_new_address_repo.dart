import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/request/add_new_address_request_entity.dart';

import '../entities/response/addresses_response_entity.dart';
import '../entities/response/area_response_entity.dart';
import '../entities/response/cities_response_entity.dart';

abstract interface class AddNewAddressRepo {
  Future<ApiResult<AddressesResponseEntity>> addNewAddress(
    AddNewAddressRequestEntity requestEntity,
  );

  Future<ApiResult<AreaResponseEntity>> getAreas();

  Future<ApiResult<CitiesResponseEntity>> getCities();
}
