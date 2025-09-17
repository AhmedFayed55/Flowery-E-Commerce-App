import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/user_address_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_address_dto.g.dart';

@JsonSerializable()
class GetUserAddressDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "addresses")
  final List<UserAddressDataDto>? address;

  GetUserAddressDto({this.message, this.address});

  factory GetUserAddressDto.fromJson(Map<String, dynamic> json) {
    return _$GetUserAddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetUserAddressDtoToJson(this);
  }
}
