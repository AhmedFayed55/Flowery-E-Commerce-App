// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseDto _$UserResponseDtoFromJson(Map<String, dynamic> json) =>
    UserResponseDto(
      message: json['message'] as String,
      user: UserModelDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseDtoToJson(UserResponseDto instance) =>
    <String, dynamic>{'message': instance.message, 'user': instance.user};
