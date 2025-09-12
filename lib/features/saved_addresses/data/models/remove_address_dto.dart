import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/remove_address_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remove_address_dto.g.dart';

@JsonSerializable()
class RemoveAddressDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "address")
  final List<RemoveAddressDataDto>? address;

  RemoveAddressDto({this.message, this.address});

  factory RemoveAddressDto.fromJson(Map<String, dynamic> json) {
    return _$RemoveAddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RemoveAddressDtoToJson(this);
  }
}
