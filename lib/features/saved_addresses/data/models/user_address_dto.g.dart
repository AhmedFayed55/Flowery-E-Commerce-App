// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddressDto _$UserAddressDtoFromJson(Map<String, dynamic> json) =>
    UserAddressDto(
      message: json['message'] as String?,
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => UserAddressDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserAddressDtoToJson(UserAddressDto instance) =>
    <String, dynamic>{'message': instance.message, 'address': instance.address};
