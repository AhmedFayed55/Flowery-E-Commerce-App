import 'package:json_annotation/json_annotation.dart';

import 'address_response_dto.dart';

part 'addresses_response_dto.g.dart';

@JsonSerializable()
class AddressesResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "address")
  final List<AddressDto>? address;

  AddressesResponseDto({this.message, this.address});

  factory AddressesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddressesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressesResponseDtoToJson(this);
  }
}
