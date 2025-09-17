import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/user_address_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_address_dto.g.dart';

@JsonSerializable()
class UserAddressDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "address")
  final List<UserAddressDataDto>? address;

  UserAddressDto({this.message, this.address});

  factory UserAddressDto.fromJson(Map<String, dynamic> json) {
    return _$UserAddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserAddressDtoToJson(this);
  }
}
