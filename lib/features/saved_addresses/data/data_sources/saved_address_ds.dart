import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/remove_address_dto.dart';

abstract interface class SavedAddressDataSource {
  Future<RemoveAddressDto> removeAddress(String id);

  Future<RemoveAddressDto> getAllAddresses();
}
