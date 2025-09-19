import 'package:flowers_ecommerce_app/features/address_details/data/models/request/add_new_address_request_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/addresses_response_dto.dart';

abstract interface class AddNewAddressDataSource {
  Future<AddressesResponseDto> addNewAddress(
    AddNewAddressRequestDto requestDto,
  );
}
