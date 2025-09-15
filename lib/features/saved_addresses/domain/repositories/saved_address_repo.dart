import 'package:flowers_ecommerce_app/features/saved_addresses/domain/entities/user_address_data_entity.dart';

import '../../../../core/errors/api_results.dart';

abstract interface class SavedAddressRepo {
  Future<ApiResult<List<UserAddressDataEntity>>> removeAddress(String id);

  Future<ApiResult<List<UserAddressDataEntity>>> getAllAddresses();
}
