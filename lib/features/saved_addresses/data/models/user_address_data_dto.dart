import 'package:json_annotation/json_annotation.dart';

part 'user_address_data_dto.g.dart';

@JsonSerializable()
class UserAddressDataDto {
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "lat")
  final String? lat;
  @JsonKey(name: "long")
  final String? long;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "_id")
  final String? id;

  UserAddressDataDto({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });

  factory UserAddressDataDto.fromJson(Map<String, dynamic> json) {
    return _$UserAddressDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserAddressDataDtoToJson(this);
  }
}
