import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/user_address_dto.dart';

import '../models/get_user_address_dto.dart';

abstract interface class SavedAddressDataSource {
  Future<UserAddressDto> removeAddress(String id);

  Future<GetUserAddressDto> getAllAddresses();
}
