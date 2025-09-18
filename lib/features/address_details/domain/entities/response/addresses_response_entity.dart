import 'address_response_entity.dart';

class AddressesResponseEntity {
  AddressesResponseEntity({this.message, this.address});

  String? message;
  List<AddressEntity>? address;
}
