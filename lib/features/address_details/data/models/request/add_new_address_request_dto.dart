import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_new_address_request_dto.g.dart';

@JsonSerializable()
class AddNewAddressRequestDto extends Equatable {
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

  const AddNewAddressRequestDto({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
  });

  factory AddNewAddressRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddNewAddressRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddNewAddressRequestDtoToJson(this);

  @override
  List<Object?> get props => [street, phone, city, lat, long, username];
}
