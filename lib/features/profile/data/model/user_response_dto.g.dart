// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseProfileDto _$UserResponseProfileDtoFromJson(
  Map<String, dynamic> json,
) => UserResponseProfileDto(
  message: json['message'] as String,
  user: UserModelProfileDto.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserResponseProfileDtoToJson(
  UserResponseProfileDto instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};
