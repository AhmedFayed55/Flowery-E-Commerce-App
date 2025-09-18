// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserAddressDto _$GetUserAddressDtoFromJson(Map<String, dynamic> json) =>
    GetUserAddressDto(
      message: json['message'] as String?,
      address: (json['addresses'] as List<dynamic>?)
          ?.map((e) => UserAddressDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserAddressDtoToJson(GetUserAddressDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'addresses': instance.address,
    };
