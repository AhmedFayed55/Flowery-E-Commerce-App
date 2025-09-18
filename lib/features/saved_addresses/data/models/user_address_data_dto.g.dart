// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddressDataDto _$UserAddressDataDtoFromJson(Map<String, dynamic> json) =>
    UserAddressDataDto(
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      username: json['username'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$UserAddressDataDtoToJson(UserAddressDataDto instance) =>
    <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'username': instance.username,
      '_id': instance.id,
    };
