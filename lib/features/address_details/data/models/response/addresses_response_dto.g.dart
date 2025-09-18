// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressesResponseDto _$AddressesResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddressesResponseDto(
  message: json['message'] as String?,
  address: (json['address'] as List<dynamic>?)
      ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AddressesResponseDtoToJson(
  AddressesResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'address': instance.address,
};
