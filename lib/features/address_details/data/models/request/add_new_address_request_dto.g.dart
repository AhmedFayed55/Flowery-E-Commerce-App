// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_address_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewAddressRequestDto _$AddNewAddressRequestDtoFromJson(
  Map<String, dynamic> json,
) => AddNewAddressRequestDto(
  street: json['street'] as String?,
  phone: json['phone'] as String?,
  city: json['city'] as String?,
  lat: json['lat'] as String?,
  long: json['long'] as String?,
  username: json['username'] as String?,
);

Map<String, dynamic> _$AddNewAddressRequestDtoToJson(
  AddNewAddressRequestDto instance,
) => <String, dynamic>{
  'street': instance.street,
  'phone': instance.phone,
  'city': instance.city,
  'lat': instance.lat,
  'long': instance.long,
  'username': instance.username,
};
